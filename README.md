# Viorant Docs

User documentation for the **Viorant Hub**, built with [Mintlify](https://mintlify.com).
Published from `main` to [viorant.mintlify.site](https://viorant.mintlify.site)
(custom domain `docs.viorant.ai` — see below).

## Structure

- `docs.json` — site config: theme, brand colors (amber `#f59e0b`), and navigation.
- Content lives in `.mdx` files, grouped by the navigation in `docs.json`:
  - `getting-started/` — install, sign in, first run
  - `concepts/` — agents, the Masters, skills, connectors, providers & models
  - `masters/` — Prompt, Model, Skill, Agent
  - `connectors/`, `providers/`, `run-agent-locally.mdx`, `troubleshooting.mdx`

The docs track **feature stability**: surfaces that survive the 1.1 release are
documented first. **Spaces, Memory, and Deploy** sections land with 1.1.

## Local preview

```bash
npm i -g mint      # one-time
mint dev           # serves the docs locally with live reload
mint broken-links  # validate links before pushing
```

## Custom domain (`docs.viorant.ai`)

1. In the Mintlify dashboard → **Settings → Custom Domain**, add `docs.viorant.ai`.
   Mintlify shows the exact CNAME target to point at.
2. On **Cloudflare** (`viorant.ai` zone) add the record directly:
   - **Type** `CNAME` · **Name** `docs` · **Target** the value from step 1
     (typically `cname.mintlify.app`)
   - **Proxy status: DNS only** (grey cloud) — Mintlify terminates TLS and issues the
     cert; proxying through Cloudflare's orange cloud blocks cert issuance.

## Assets

Brand logo + favicon are exported from the Viorant Design System (Figma),
background-stripped to transparent: `logo/light.svg` (orange+grey wordmark),
`logo/dark.svg` (white wordmark), `favicon.svg` (flat glyph). Screenshots referenced
as "being added" in the Master pages are pending real Hub captures.
