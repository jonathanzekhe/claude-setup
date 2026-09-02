---
name: check
description: Run all checks on Brvndlab (Convex typecheck + TypeScript + accents scan)
disable-model-invocation: true
---

# Check Brvndlab

Run all quality checks in parallel:

1. **Convex typecheck**: `cd "/Users/businessmanagement/Documents/Claude AI/Brvndlab/brvndlab-app" && npx convex dev --once`
2. **TypeScript typecheck**: `npx tsc --noEmit 2>&1 | grep "error" | grep -v "brand-os/edit\|brand-os/page.tsx:395\|calendar/page.tsx" | head -20`
3. **Accent scan**: `grep -rn '\\u00[0-9a-f]' src/ --include="*.tsx" --include="*.ts" | head -10`

Report results as:
- Convex: PASS or FAIL (with errors)
- TypeScript: PASS or FAIL (with errors, excluding known pre-existing)
- Accents: CLEAN or X occurrences found

If everything passes, say "Tout est propre."
