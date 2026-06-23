# Awesome GPU Cloud

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
[![License: CC0-1.0](https://img.shields.io/badge/License-CC0_1.0-lightgrey.svg)](http://creativecommons.org/publicdomain/zero/1.0/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](./CONTRIBUTING.md)

A curated registry of GPU cloud providers, serverless GPU inference platforms, Kubernetes GPU platforms, and supporting tooling for training, fine-tuning, and serving AI models.

The goal is to be the definitive place to discover on-demand, reserved, and serverless GPU compute—from hyperscalers and GPU-first clouds to marketplaces and container images.

**Inclusion criteria:** Resources must be publicly accessible, actively maintained, and directly related to GPU cloud compute or GPU-accelerated AI infrastructure. General CPU cloud services and closed, undocumented offerings are out of scope. See [CONTRIBUTING.md](./CONTRIBUTING.md) for the full quality bar.

---

## Contents

- [Major Cloud Providers](#major-cloud-providers)
- [Serverless GPU Inference](#serverless-gpu-inference)
- [GPU Cloud Marketplaces](#gpu-cloud-marketplaces)
- [Kubernetes GPU Platforms](#kubernetes-gpu-platforms)
- [Budget / Consumer GPU Cloud](#budget--consumer-gpu-cloud)
- [Enterprise HPC Cloud](#enterprise-hpc-cloud)
- [AI Training Platforms](#ai-training-platforms)
- [Container Registries / Images](#container-registries--images)
- [Notes](#notes)
- [Contributing](#contributing)
- [License](#license)

---

## Major Cloud Providers

Hyperscale clouds with managed GPU instances for training, inference, and HPC.

- **[AWS EC2 Accelerated Computing](https://aws.amazon.com/ec2/instance-types/accelerated-computing/)** `Official` — P5/P5e (H100/H200), P4d (A100), G6e (L40S), and Trn/Inf accelerators with EFA networking and UltraClusters.
  - Pricing: on-demand, spot, reserved, and capacity blocks.
- **[Google Cloud GPU Instances](https://cloud.google.com/compute/docs/gpus)** `Official` — A3 (H100), A3 Ultra (H200), A4 (B200), A4X (GB200), G2 (L4), and G4 (RTX PRO 6000) machine types.
  - Tight integration with Vertex AI, GKE, and TPUs.
- **[Azure NC/ND GPU Virtual Machines](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes/gpu-accelerated/)** `Official` — NCads H100 v5, ND H100 v5, NC A100 v4, and NVads A10 v5 series with InfiniBand options.
  - Strong fit for Windows/Linux workstations and Azure ML training jobs.
- **[Oracle Cloud Infrastructure GPU](https://www.oracle.com/cloud/compute/gpu/)** `Official` — Bare-metal and VM instances with H100, H200, A100, L40S, and AMD MI300X GPUs; RDMA cluster networking.
  - Often priced below AWS/GCP/Azure for equivalent shapes; free egress tiers.
- **[IBM Cloud GPU](https://www.ibm.com/cloud/gpu)** `Official` — NVIDIA H100 and A100 instances for AI training, inference, and VDI workloads.
- **[Alibaba Cloud GPU](https://www.alibabacloud.com/product/gpu)** `Official` — GN7 (A10), GN10e (V100), and GPU-accelerated ECS instances for AI and rendering in Asia-Pacific.

---

## Serverless GPU Inference

Platforms that abstract away infrastructure and scale GPU workloads to zero.

- **[Modal](https://modal.com/)** `Official` — Serverless GPU functions with a Python SDK; deploy inference, training, and batch jobs on L40S, A100, and H100.
  - Pricing: per-second billing; H100 from ~$3.95/hr, L40S from ~$1.95/hr.
- **[RunPod Serverless](https://www.runpod.io/serverless-gpu)** `Official` — Autoscaling GPU endpoints with FlashBoot; supports 30+ GPU types from RTX 4090 to H200.
  - Pricing: billed by the millisecond; H100 from ~$1.99/hr on Community Cloud.
- **[Baseten](https://www.baseten.co/)** `Official` — Model-serving platform with low-latency inference, async workers, and the open-source Truss packaging framework.
- **[Replicate](https://replicate.com/)** `Official` — Run and deploy open-source ML models as scalable APIs; supports custom models and a large public model zoo.
- **[Fal](https://fal.ai/)** `Official` — Generative-media inference engine optimized for diffusion and real-time image/video workloads.
- **[Koyeb](https://www.koyeb.com/)** `Official` — Serverless cloud with global GPU deployment and scale-to-zero; supports H100, A100, and Tenstorrent accelerators.
  - Pricing: A100 ~$2/hr, H100 ~$3.30/hr.
- **[Novita AI](https://novita.ai/)** `Official` — GPU cloud and serverless inference with 200+ ready-to-use models and on-demand GPU instances.
- **[Google Cloud Run GPUs](https://cloud.google.com/run)** `Official` — Serverless container platform with NVIDIA L4 GPU support and request-driven or job-based GPU workloads.
- **[Cerebrium](https://www.cerebrium.ai/)** `Official` — Serverless GPU platform for AI inference and training with infrastructure-as-code and fast cold starts.
- **[Beam Cloud](https://www.beam.cloud/)** `Official` — Serverless GPU cloud for training and inference with per-second billing and Python SDK.

---

## GPU Cloud Marketplaces

Aggregators and peer-to-peer marketplaces for finding GPU capacity across providers.

- **[Vast.ai](https://vast.ai/)** `Community` / `Marketplace` — Peer-to-peer GPU marketplace with 20,000+ GPUs; on-demand, interruptible, and reserved pricing.
  - Pricing: RTX 4090 from ~$0.27/hr, A100 80GB from ~$0.70/hr.
- **[TensorDock](https://www.tensordock.com/)** `Community` / `Marketplace` — Marketplace of independent hosts offering H100, A100, RTX 4090, and more across 100+ locations.
  - Pricing: H100 from ~$2.20/hr; no quotas or long-term contracts.
- **[Shadeform](https://shadeform.com/)** `Community` / `Marketplace` — GPU cloud marketplace deploying across 30+ clouds with one console, API, and bill.
- **[Prime Intellect](https://www.primeintellect.ai/)** `Community` — Decentralized compute exchange aggregating 12+ providers for distributed training and inference.
- **[GPUFindr](https://gpufindr.com/)** `Community` — Live price comparison across CoreWeave, Lambda, RunPod, Vast.ai, and other GPU clouds; free API and MCP server.
- **[NodeHawk](https://nodehawk.polsia.app/)** `Community` — Price aggregator scanning 50+ clouds to surface the cheapest GPU deals.

---

## Kubernetes GPU Platforms

Managed Kubernetes services and schedulers purpose-built for GPU workloads.

- **[CoreWeave Kubernetes Service](https://www.coreweave.com/products/kubernetes)** `Official` — Kubernetes-native GPU cloud with bare-metal NVIDIA H100, H200, B200, and GB200 nodes.
- **[RunPod](https://www.runpod.io/)** `Official` — GPU cloud with Kubernetes support, virtual kubelet integrations, and on-demand Pods/Serverless/Clusters.
- **[Nebius AI Cloud](https://nebius.com/)** `Official` — Full-stack AI cloud with managed Kubernetes and Slurm, H100/H200/B200/GB200 clusters, and InfiniBand.
- **[Akamai Cloud GPU](https://www.akamai.com/products/gpu)** `Official` — GPU instances and managed Kubernetes (LKE) nodes with RTX PRO 6000 Blackwell and L40S GPUs.
- **[Crusoe Cloud Managed Kubernetes](https://www.crusoe.ai/cloud)** `Official` — Managed Kubernetes for GPU and CPU workloads with InfiniBand-backed clusters.
- **[NVIDIA Run:ai](https://www.run.ai/)** `Official` — Kubernetes-native GPU orchestration and workload scheduler for maximizing AI compute utilization.
- **[SUNK (Slurm on Kubernetes)](https://www.coreweave.com/products/slurm-on-kubernetes)** `Official` — CoreWeave's Slurm-on-Kubernetes solution for running HPC and AI training on the same cluster.

---

## Budget / Consumer GPU Cloud

Low-cost options that prioritize price-per-FLOP, often using consumer GPUs.

- **[Vast.ai](https://vast.ai/)** `Community` — Marketplace with consumer RTX 3090/4090 and data-center GPUs at market-driven prices.
  - Pricing: RTX 3090 from ~$0.07/hr, RTX 4090 from ~$0.27/hr.
- **[SaladCloud](https://salad.com/)** `Community` — Distributed cloud using consumer gaming GPUs across 450,000+ providers.
  - Pricing: RTX 4090 from ~$0.16/hr, H100 from ~$0.99/hr.
- **[JarvisLabs](https://jarvislabs.ai/)** `Community` — Per-minute billing GPU cloud for individual developers and small teams.
  - Pricing: RTX 3090 from ~$0.29/hr, H100 from ~$2.69/hr.
- **[Paperspace](https://www.paperspace.com/)** `Official` — Managed GPU notebooks and instances from RTX 4090 to A100/H100.
- **[TensorDock](https://www.tensordock.com/)** `Community` — Marketplace with consumer and data-center GPUs; full VM control.
- **[DataCrunch / Verda](https://datacrunch.io/)** `Official` — Low-cost GPU instances and clusters in Iceland/Finland.
  - Pricing: H100 from ~$2.29/hr.
- **[Hyperstack](https://www.hyperstack.cloud/)** `Official` — EU-focused GPU cloud with H100, A100, and L40S instances; 100% renewable energy.

---

## Enterprise HPC Cloud

GPU-first clouds built for large-scale training, HPC, and production AI at scale.

- **[CoreWeave](https://www.coreweave.com/)** `Official` — AI hyperscaler with Kubernetes-native H100/H200/B200/GB200/GB300 clusters and InfiniBand.
  - Customers include OpenAI, Mistral AI, and Jane Street.
- **[Lambda](https://lambda.ai/)** `Official` — GPU cloud and superclusters for AI training/inference; 1-Click Clusters and Lambda Stack.
  - Pricing: H100 SXM from ~$3.29/hr, A100 SXM from ~$1.29/hr.
- **[NVIDIA DGX Cloud](https://www.nvidia.com/en-us/data-center/dgx-cloud/)** `Official` — AI supercomputing-as-a-service with DGX systems, NIM/NeMo, and NVIDIA Cloud Partners.
- **[NVIDIA DGX Cloud Lepton](https://www.nvidia.com/en-us/data-center/dgx-cloud-lepton/)** `Official` — Compute marketplace connecting developers to tens of thousands of GPUs across global cloud partners.
- **[FluidStack](https://www.fluidstack.io/)** `Official` — Exascale GPU clusters for frontier AI training, deployed in 48 hours across global data centers.
- **[Crusoe Energy](https://www.crusoe.ai/)** `Official` — AI cloud powered by stranded and renewable energy; H100/H200/GB200 and managed inference.
- **[GMI Cloud](https://www.gmicloud.ai/)** `Official` — GPU cloud with H100, H200, B200, and GB200 clusters and managed Kubernetes.
- **[Nscale](https://www.nscale.com/)** `Official` — GPU cloud built for large-scale AI training and sovereign AI deployments.
- **[Voltage Park](https://voltagepark.com/)** `Official` — Bare-metal GPU cloud with H100 clusters for training and inference.

---

## AI Training Platforms

Managed platforms that streamline distributed training, fine-tuning, and model development.

- **[Anyscale](https://www.anyscale.com/)** `Official` — Managed Ray platform for distributed training, batch inference, and serving across clouds.
- **[Together AI GPU Clusters](https://www.together.ai/gpu-clusters)** `Official` — Self-serve H100/H200/B200/GB200 clusters with InfiniBand and Kubernetes/Slurm orchestration.
- **[Databricks Mosaic AI](https://www.databricks.com/product/machine-learning/mosaic-ai)** `Official` — Unified platform for fine-tuning, training, and serving LLMs inside the Databricks Lakehouse.
- **[MosaicML Foundry](https://github.com/mosaicml/llm-foundry)** `Community` — Open-source training framework for LLMs from 125M to 70B+ parameters.
- **[Hugging Face Training Cluster as a Service](https://huggingface.co/training-cluster)** `Community` — On-demand GPU clusters integrated with Hugging Face tools and datasets.
- **[Weights & Biases](https://wandb.ai/)** `Official` — MLOps platform for experiment tracking, model registry, and performance monitoring for GPU training runs.

---

## Container Registries / Images

Registries and pre-built images for GPU-accelerated AI workloads.

- **[NVIDIA NGC Catalog](https://catalog.ngc.nvidia.com/)** `Official` — Curated GPU-optimized containers, models, SDKs, and Helm charts for PyTorch, TensorFlow, TensorRT, CUDA, and more.
- **[Docker Hub](https://hub.docker.com/)** `Official` — Public container registry hosting official GPU-enabled images for CUDA, PyTorch, TensorFlow, and community ML projects.
- **[GitHub Container Registry](https://github.com/features/packages)** `Official` — Container and artifact hosting tightly integrated with GitHub Actions and repositories.
- **[Amazon ECR](https://aws.amazon.com/ecr/)** `Official` — Fully managed container registry for storing and deploying GPU container images on AWS.
- **[Google Artifact Registry](https://cloud.google.com/artifact-registry)** `Official` — Managed artifact and container registry for Google Cloud GPU/AI workloads.
- **[Red Hat Quay](https://quay.io/)** `Official` — Enterprise container registry with vulnerability scanning and geo-replication.

---

## Related Awesome Lists

- [awesome-oracle-agentic-skills-mcp](https://github.com/oracle/awesome-oracle-agentic-skills-mcp) — Oracle MCP servers and agentic skills.
- [awesome-nvidia](https://github.com/NVIDIA/awesome-nvidia) — NVIDIA libraries, tools, and frameworks.
- [awesome-llm](https://github.com/Hannibal046/Awesome-LLM) — Large language model resources.
- [awesome-local-llm](https://github.com/janhq/awesome-local-llm) — Running LLMs locally.
- [awesome-mcp-servers](https://github.com/modelcontextprotocol/awesome-mcp-servers) — Model Context Protocol servers.

---

## Notes

- **Pricing is indicative:** Rates change frequently and vary by region, GPU SKU (PCIe vs SXM), contract length, and spot/interruptible availability. Always verify current pricing on the provider's site.
- **Community vs. Official:** `Official` denotes the provider's own service; `Community` / `Marketplace` denotes peer-to-peer, aggregator, or open-source/community-maintained resources.
- **Reliability trade-offs:** Marketplace and consumer-GPU options can offer dramatic cost savings, but may have weaker SLAs, variable networking, and preemptible instances. Use them for fault-tolerant batch work and keep production APIs on SLA-backed platforms.
- **Multi-node training:** For large distributed training jobs, prioritize providers with NVLink/NVSwitch, InfiniBand/RoCE, and RDMA support (CoreWeave, Lambda, Nebius, Crusoe, AWS P5 UltraClusters, etc.).
- **Updates welcome:** If you find a new GPU cloud provider or category, see [CONTRIBUTING.md](./CONTRIBUTING.md) and open a pull request.

---

## Contributing

Read [CONTRIBUTING.md](./CONTRIBUTING.md) for the quality bar, entry format, and PR process.

---

## License

This list is released into the public domain under [CC0-1.0](./LICENSE).

## Want us to build this for you?

Enterprise AI Atlas is maintained by [Vibe Coding Agency](https://vibecodingagency.com). We prototype and ship agentic systems, MCP servers, and enterprise AI integrations for teams that need working software fast — without hiring a full AI engineering team.
