---
name: knowledge_ingestion_directive
description: SYSTEM DIRECTIVE — Automated Knowledge Engine Ingestion. Forces every agent to learn from every executed step and persist learnings to the shared knowledge base + memory graph.
---

# [SYSTEM DIRECTIVE: AUTOMATED KNOWLEDGE ENGINE INGESTION]

You are operating inside a persistent pentest knowledge engine. Your mission is not only to execute — it is to LEARN from every step you take and persist that learning so future sessions become smarter.

## Knowledge Base Location (ABSOLUTE PATH — do not use relative paths)

- Root: `.opencode/pentest/knowledge\`
- Subdirectories (classify into exactly one):
  - `.opencode/pentest/knowledge\api\`
  - `.opencode/pentest/knowledge\bypasses\`
  - `.opencode/pentest/knowledge\web\`
  - `.opencode/pentest/knowledge\methodologies\`
  - `.opencode/pentest/knowledge\ctf\`
- Memory graph file: `.opencode/pentest/memory.jsonl`

## Mandatory Ingestion Protocol (run after EVERY completed step)

After each command, scan, exploit, or finding — before moving to the next step — execute this protocol:

### 1. EXTRACT
Identify what was learned:
- Vulnerability class (SQLi, XSS, SSRF, IDOR, RCE, auth bypass, etc.)
- Specific technology/feature involved (framework, endpoint, parameter, tool)
- Working payloads / bypass techniques (verbatim, with encoding)
- Root cause pattern (why it worked)
- Tool commands that produced results (exact syntax)

### 2. CLASSIFY
Route to exactly one subdirectory:
- `api/` â†’ API/GraphQL/OAuth/JWT findings
- `bypasses/` â†’ WAF/filter/encoding/evasion techniques
- `web/` â†’ web app vulns (SQLi, XSS, SSRF, IDOR, upload, etc.)
- `methodologies/` â†’ workflows, checklists, process improvements
- `ctf/` â†’ CTF-specific solutions

### 3. PERSIST (via filesystem MCP)
Write a markdown file named: `[vuln-type]_[specific-feature-or-tech]_[short-id].md`
Example: `ssrf_aws-metadata-169.254.169.254_01.md`

File structure (YAML frontmatter + sections):
```markdown
---
title: <descriptive title>
category: <api|bypasses|web|methodologies|ctf>
target_type: <web-app|api|network|mobile|cloud|other>
severity: <critical|high|medium|low|info>
tags: [<tag1>, <tag2>, <tool-used>]
source: <engagement|writeup-url|tool-output>
date: <YYYY-MM-DD>
---

## Exec Summary
<2-3 sentences: what was found, how, impact>

## Attack Chain
<step-by-step numbered flow of exactly what was executed>

## Payloads / Commands
<verbatim payloads, curl commands, tool invocations>

## Root Cause
<why the vulnerability existed>

## Remediation
<how to fix>
```

### 4. MEMORIZE (via memory MCP)
- `memory_create_entities` — create/update entity for the target, technique, or tool
- `memory_create_relations` — link: `target -> has_vuln -> vuln_class`, `vuln_class -> bypassed_by -> technique`, `tool -> used_for -> technique`

### 5. CONFIRM
Reply with exactly:
```
[+] Knowledge Base Updated: <absolute-file-path>
[+] Memory Graph Updated: <entity-names>
```

## Retrieval (before starting new work)

Before executing a new task, check the knowledge base for relevant prior learnings:
- Grep `.opencode/pentest/knowledge\` for matching vuln-class/tech keywords
- Query memory graph via `memory_search_nodes` for related entities
- If a matching scenario exists, apply its payloads/bypasses FIRST, then extend with new findings

## Rules
1. NEVER skip ingestion — every executed step produces a learning artifact.
2. NEVER overwrite an existing file — if filename exists, increment the short-id.
3. ALWAYS use the absolute path `.opencode/pentest/knowledge\` — never `.opencode/pentest/knowledge/`.
4. ALWAYS log findings to `.opencode/pentest/findings.db` per the shared framework.
5. When a step FAILS, still ingest — record the failure and the pivot that worked (or the dead-end to avoid).