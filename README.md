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

Set in the Mintlify dashboard → add the custom domain; Mintlify returns a CNAME
target. **Vivien** adds that `CNAME` record on Cloudflare for `docs.viorant.ai`.

## Assets to swap in

The `logo/` and `favicon.svg` are still Mintlify-starter placeholders — replace with
the Viorant brand logo (light) and favicon. Screenshots referenced as "being added"
in the Master pages are pending real Hub captures.
