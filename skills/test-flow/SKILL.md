---
name: test-flow
description: Test a user flow on Brvndlab using Playwright browser automation
disable-model-invocation: true
---

# Test Flow Brvndlab

Test a specific user flow on https://app.brvndlab.com using the Playwright MCP browser.

Usage: `/test-flow [flow-name]`

Available flows:
- `login` -- Navigate to app, verify login page loads, check for errors
- `dashboard` -- Login, verify dashboard loads, check coach note, Brand OS score
- `messaging` -- Login, go to /messaging, verify contacts load, send a test message
- `collaborateurs` -- Login, go to /collaborateurs, verify cards load
- `collab-login [email]` -- Login as collaborator, verify correct dashboard and restricted nav

Steps:
1. Use `mcp__plugin_playwright_playwright__browser_navigate` to open the URL
2. Use `mcp__plugin_playwright_playwright__browser_snapshot` to capture state
3. Check for errors, missing elements, broken layouts
4. Report: PASS with screenshots or FAIL with details

If no flow specified, run `login` + `dashboard` as smoke test.
