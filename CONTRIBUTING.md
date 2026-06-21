# Contributing

Contributions are welcome. Please read this guide before opening a pull request.

## What belongs in this list

This registry is for resources that provide GPU cloud compute or directly support GPU-accelerated AI workloads. Acceptable entries include:

- GPU cloud providers (hyperscalers, GPU-first clouds, and bare-metal GPU hosts).
- Serverless GPU inference platforms and model-serving services.
- GPU cloud marketplaces and price-comparison aggregators.
- Kubernetes GPU platforms and GPU workload schedulers.
- Budget/consumer GPU clouds using RTX-class or similar hardware.
- Enterprise HPC clouds and AI training platforms.
- Container registries and official GPU-optimized base images.

## What does **not** belong

- General CPU cloud services with no GPU offering.
- Closed-source or paywalled-only tools with no public documentation.
- Affiliate links or referral pages that do not add independent information.
- Duplicate entries.

## Quality bar

Every submission must be:

1. **Publicly accessible** — open source or publicly documented.
2. **Actively maintained** — the provider or project should have current offerings and meaningful updates within the last 12 months.
3. **Documented** — a real website or README with setup/pricing information.
4. **Correctly categorized** — placed under the category that best matches its primary use case.
5. **Honestly labeled** — use the `Official` or `Community` badge. Use `Marketplace` for aggregators when helpful.
6. **Real and verifiable** — link to the provider's official domain; avoid short-lived or vaporware offerings.

## Entry format

Use this pattern:

```markdown
- **[Name](URL)** `Official` — One-sentence description.
  - Pricing note or key detail.
```

If there is no pricing note, omit the sub-bullet.

## Product sections

The README is organized by **GPU cloud category**, not by provider. New categories are allowed only if they contain at least three high-quality entries.

## Pull request process

1. Fork the repository.
2. Add your entry in the correct category section.
3. Run `./scripts/validate-links.sh` and fix any broken links or anchors.
4. Open a pull request with a clear description of the resource and why it fits.

One resource per pull request is preferred.
