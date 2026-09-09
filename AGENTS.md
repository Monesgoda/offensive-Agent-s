# Global OpenCode Pentest Agent Index

Master index of all 24 pentest subagents installed globally under
`~/.config/opencode\agents\`. Each agent binds to the
shared pentest resource layer (see **Shared Resources** below).

Invocation: delegate to any agent by its name (directory) via its invocation
phrase, or read the individual `agent.md` for its trigger description.

---

## Shared Resources (Global Pentest Framework)

All 24 agents bind to the same absolute-path resource layer:

| Resource | Path |
|----------|------|
| Findings Database | `~/.config/opencode\pentest\findings.db` |
| Knowledge Engine | `~/.config/opencode\pentest\knowledge\` |
| Scripts / Tooling | `~/.config/opencode\pentest\scripts\` |
| Scope File | `~/.config/opencode\pentest\scope.json` |
| DB Init Script | `~/.config/opencode\pentest\scripts\init_db.sh` |

Every agent enforces the scope rules in `scope.json` and logs findings to
`findings.db` (tables: `engagements`, `hosts`, `services`, `vulns`,
`credentials`, `chains`, `session_log`).

---

## Agent Index

### Reconnaissance & Discovery
| Agent | Role | Invocation Tag |
|-------|------|----------------|
| `recon-advisor` | Scan-output analysis, enumeration strategy, hands-on recon execution | "run recon tools", "analyze nmap output" |
| `osint-collector` | OSINT, open-source intelligence, target dossier building | "OSINT", "information gathering", "target profiling" |
| `ai-recon` | AI-assisted attack-surface mapping, subdomain/port/tech fingerprinting | "AI recon", "attack surface mapping" |
| `vuln-scanner` | Vulnerability scanning (nuclei/nikto/OpenVAS), CVE identification | "vulnerability scan", "run nuclei" |

### Offensive Web & Application
| Agent | Role | Invocation Tag |
|-------|------|----------------|
| `web-hunter` | Web app pentest: dir brute-force, SQLi, XSS, auth, WAF bypass | "web app pentest", "directory brute force" |
| `api-security` | REST/GraphQL API, OAuth/OIDC, JWT, API enumeration | "API security testing", "GraphQL exploitation" |
| `bizlogic-hunter` | Business-logic flaws, workflow bypass, race conditions, authz boundaries | "business logic test", "price manipulation" |
| `bug-bounty` | Bug-bounty methodology, HackerOne/Bugcrowd reporting | "bug bounty", "bounty report" |
| `code-auditor` | Secure code review / static analysis (Semgrep, CodeQL) | "code review", "SAST", "audit source" |

### Network, Infrastructure & Systems
| Agent | Role | Invocation Tag |
|-------|------|----------------|
| `network-attacker` | L2/L3 internals: LLMNR/NBT-NS/mDNS, ARP/MITM, NTLM relay, IPv6/mitm6, VLAN hop | "network pentest", "ARP spoof", "LLMNR" |
| `ad-attacker` | Active Directory attacks: BloodHound, Impacket, Kerberos, delegation | "AD attack", "BloodHound", "Kerberos" |
| `cloud-security` | AWS/Azure/GCP, IAM privesc, K8s, containers, serverless | "cloud pentest", "cloud misconfiguration" |
| `container-breakout` | Container/pod escape, Docker breakout, runc/containerd CVEs, kubelet | "container escape", "k8s pod escape" |
| `database-attacker` | SQL/NoSQL injection depth, DB enumeration, DBMS privesc | "database attack", "SQL injection depth" |

### Exploitation, Access & Post-Exploitation
| Agent | Role | Invocation Tag |
|-------|------|----------------|
| `payload-crafter` | Payload generation: msfvenom, shellcode, reverse shells, EDR-test binaries | "generate payload", "msfvenom", "shellcode" |
| `exploit-guide` | Exploitation technique/methodology, tool configuration | "exploitation method", "attack methodology" |
| `exploit-chainer` | Chain isolated vulns into multi-step attack paths with stage approval | "chain exploits", "attack path" |
| `attack-planner` | Correlate findings, build attack chains, prioritize vectors | "attack planning", "lateral movement plan" |
| `lateral-movement` | Post-foothold lateral movement: PTH/T, PsExec/WMI/WinRM, pivoting | "lateral movement", "pass-the-hash" |
| `privesc-advisor` | Linux/Windows privesc, local enumeration, container escape | "privilege escalation", "privesc" |

### Red Team, Blue Team & Specialized
| Agent | Role | Invocation Tag |
|-------|------|----------------|
| `llm-redteam` | LLM/AI red teaming: prompt injection, jailbreaks, RAG poisoning, MCP abuse | "LLM red team", "prompt injection" |
| `malware-analyst` | Malware analysis, reverse engineering, binary triage, sandboxing | "malware analysis", "reverse engineer" |
| `detection-engineer` | Detection rules, SIEM queries, threat hunting, blue-team detections | "detection rule", "SIEM query", "threat hunting" |
| `ctf-solver` | CTF challenges: web, binary, crypto, forensics, rev, privesc | "CTF", "HackTheBox", "TryHackMe" |

---

## Global Context Header

Each agent's `agent.md` (and `SKILL.md`) has the **GLOBAL CONTEXT BINDING**
header appended, which enforces:
1. Loading and obeying `scope.json` before every target command.
2. Logging findings to `findings.db` via `init_db.sh` / SQLite CLI.
3. Storing knowledge under the shared `knowledge\` engine.
4. Coordinating hand-offs to sibling agents via this index.

## Note
- `pentest\agents\_scope-guard.md`, `ingest_knowledge.md`, and
  `retrieve_scenarios.md` are shared utility blocks, not standalone agents,
  and are intentionally **not** promoted to the global agent directory.
- `operator.md` remains the primary global agent and is preserved in
  `~/.config/opencode\agents\`.
