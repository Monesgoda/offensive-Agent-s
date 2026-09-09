# GitHub Repository Info & Full Documentation

## 📝 1. GitHub Description (About Section)
An AI-powered penetration testing framework featuring a primary orchestration agent and 24 specialized sub-agents for authorized penetration testing, bug bounty programs, and CTF challenges.

**Suggested Tags:** `penetration-testing` `bug-bounty` `ctf` `ai-agents` `cybersecurity` `red-team` `opencode` `offensive-security`

---

## 📄 2. README.md Content

```markdown
# 🤖 Offensive Agents — AI-Powered Penetration Testing Framework

An offensive security framework built on [OpenCode](https://opencode.ai) featuring a primary orchestration agent and 24 specialized sub-agents for authorized penetration testing, bug bounty programs, and CTF challenges.

> ⚠️ **Legal Disclaimer:** This framework is intended exclusively for authorized security testing, bug bounty programs, and controlled lab environments (HTB, TryHackMe, PortSwigger Labs). The user is solely responsible for ensuring proper authorization before testing any target.

---

## 🏗️ Architecture

**Operator (Primary Agent)**
└── **24 Specialized Sub-Agents**
    ├── **Reconnaissance:** `recon-advisor`, `osint-collector`, `ai-recon`, `vuln-scanner`
    ├── **Web & API:** `web-hunter`, `api-security`, `bizlogic-hunter`, `bug-bounty`, `code-auditor`
    ├── **Network & Infra:** `network-attacker`, `ad-attacker`, `cloud-security`, `container-breakout`, `database-attacker`
    ├── **Exploitation:** `payload-crafter`, `exploit-guide`, `exploit-chainer`, `attack-planner`, `lateral-movement`, `privesc-advisor`
    └── **Specialized:** `llm-redteam`, `malware-analyst`, `detection-engineer`, `ctf-solver`

---

## ✨ Features

* **Smart Delegation** — Operator automatically routes tasks to the right sub-agent.
* **Scope Enforcement** — Every agent validates targets against `scope.json` before execution.
* **Findings Database** — SQLite DB with 8 tables tracking hosts, services, vulns, chains.
* **Knowledge Engine** — Persistent write-up and technique storage across engagements.
* **Skill Loading** — Each sub-agent loads its `SKILL.md` for specialized methodology.
* **MCP Integration** — Burp Suite, Playwright, Notion, Filesystem, Memory, GitHub.
* **OPSEC Tagging** — Every command tagged `QUIET` / `MODERATE` / `LOUD`.
* **Attack Chaining** — Automated multi-stage exploit path building.

---

## 🚀 Quick Start

### Requirements
* [OpenCode](https://opencode.ai) installed
* Node.js 18+
* An LLM API key (OpenRouter, OpenAI, Anthropic, etc.)

### Installation Steps

```bash
# 1. Clone the repo:
git clone https://github.com/YOUR_USERNAME/offensive-agents
cd offensive-agents

# 2. Copy config to OpenCode directory:
cp -r . ~/.config/opencode/

# 3. Configure your settings:
nano ~/.config/opencode/opencode.jsonc
# (Add your API key and model)

# 4. Set your engagement scope:
nano ~/.config/opencode/pentest/scope.json
# (Add your authorized target)

# 5. Initialize the findings database:
bash ~/.config/opencode/pentest/scripts/init_db.sh

# 6. Launch OpenCode:
opencode
```

---

## ⚙️ Configuration

### `opencode.jsonc`
```json
{
  "model": "YOUR_MODEL_HERE",
  "fallback": ["YOUR_FALLBACK_MODEL"],
  "mcp": {
    "filesystem": { ... },
    "memory": { ... },
    "github": { ... }
  }
}
```

### `pentest/scope.json`
```json
{
  "engagement": "YOUR_ENGAGEMENT_NAME",
  "target": "TARGET_DOMAIN",
  "in_scope": [],
  "out_of_scope": [],
  "rules": {
    "max_rate_rps": 10,
    "no_destructive_actions": true,
    "no_dos": true,
    "require_scope_check": true,
    "require_user_approval": true,
    "passive_first": true
  }
}
```

---

## 📁 Structure

```text
~/.config/opencode/
├── opencode.jsonc          ← Main config (API keys, MCP servers)
├── AGENTS.md               ← Agent index and documentation
├── agents/                 ← Global agents (loaded by OpenCode)
│   ├── operator.md         ← Primary orchestration agent
│   ├── recon-advisor.md    ← + 23 sub-agents
│   └── ...
└── pentest/                ← Shared framework layer
    ├── scope.json          ← Engagement scope rules
    ├── findings.db         ← SQLite findings database (auto-created)
    ├── memory.jsonl        ← Persistent memory graph
    ├── schema.sql          ← DB schema
    ├── agents/             ← Sub-agent source files
    │   ├── recon-advisor/
    │   │   ├── agent.md
    │   │   └── SKILL.md
    │   └── ...
    ├── knowledge/          ← Vulnerability knowledge engine
    │   ├── api/
    │   ├── web/
    │   ├── bypasses/
    │   └── ...
    └── scripts/
        ├── init_db.sh
        └── doctor.sh
```

---

## 🤝 Contributing

PRs welcome. If you add a new sub-agent:
1. Create `pentest/agents/[agent-name]/agent.md` + `SKILL.md`
2. Add the merged version to `agents/[agent-name].md`
3. Register it in `AGENTS.md` and `operator.md`

---

## 📺 Video Walkthrough

> 🎬 Full setup and demo video coming soon on YouTube.

---

## 📄 License

**MIT License** — Use responsibly and only on authorized targets.
```
