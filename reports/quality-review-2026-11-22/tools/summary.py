"""Summary of the Lighthouse JSON reports of a folder: scores and the main metrics."""
import glob
import json
import os
import sys

for f in sorted(glob.glob(f'{sys.argv[1]}/lh-*.json')):
    d = json.load(open(f))
    a, c = d['audits'], d['categories']
    s = {k: (round(v['score'] * 100) if v['score'] is not None else None) for k, v in c.items()}
    keys = ['largest-contentful-paint', 'cumulative-layout-shift', 'total-blocking-time', 'first-contentful-paint', 'server-response-time']
    m = {k.split('-')[0] + k.split('-')[1][:1]: round(a[k]['numericValue'], 3) for k in keys if k in a}
    lcp = a.get('largest-contentful-paint-element', {}).get('details', {}).get('items', [{}])
    el = ''
    try:
        el = lcp[0]['items'][0]['node']['selector']
    except (KeyError, IndexError, TypeError):
        pass
    fails = [k for k, v in a.items() if v.get('score') == 0 and d['categories']['accessibility']['auditRefs'] and k in {r['id'] for r in d['categories']['accessibility']['auditRefs']}]
    print(os.path.basename(f), s, m, 'LCP el:', el, 'a11y fails:', fails)
