-- pentest-ai findings database
-- Version: 2

PRAGMA journal_mode=WAL;
PRAGMA foreign_keys=ON;

CREATE TABLE IF NOT EXISTS schema_version (
    version INTEGER PRIMARY KEY,
    applied_at TEXT DEFAULT (datetime('now'))
);

INSERT OR IGNORE INTO schema_version (version) VALUES (2);

CREATE TABLE IF NOT EXISTS engagements (
    id TEXT PRIMARY KEY,
    client TEXT,
    type TEXT,
    scope TEXT,
    start_date TEXT,
    end_date TEXT,
    status TEXT DEFAULT 'active',
    notes TEXT,
    created_at TEXT DEFAULT (datetime('now')),
    updated_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS hosts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    engagement_id TEXT NOT NULL REFERENCES engagements(id),
    ip TEXT,
    hostname TEXT,
    os TEXT,
    role TEXT,
    status TEXT DEFAULT 'alive',
    notes TEXT,
    discovered_by TEXT,
    created_at TEXT DEFAULT (datetime('now')),
    updated_at TEXT DEFAULT (datetime('now')),
    UNIQUE(engagement_id, ip, hostname)
);

CREATE TABLE IF NOT EXISTS services (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    host_id INTEGER NOT NULL REFERENCES hosts(id),
    port INTEGER NOT NULL,
    protocol TEXT DEFAULT 'tcp',
    service TEXT,
    version TEXT,
    banner TEXT,
    state TEXT DEFAULT 'open',
    notes TEXT,
    created_at TEXT DEFAULT (datetime('now')),
    UNIQUE(host_id, port, protocol)
);

CREATE TABLE IF NOT EXISTS vulns (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    host_id INTEGER REFERENCES hosts(id),
    service_id INTEGER REFERENCES services(id),
    engagement_id TEXT NOT NULL REFERENCES engagements(id),
    title TEXT NOT NULL,
    severity TEXT NOT NULL,
    cvss REAL,
    cve TEXT,
    description TEXT,
    evidence_file TEXT,
    status TEXT DEFAULT 'unconfirmed',
    poc_output TEXT,
    mitre_id TEXT,
    tool_used TEXT,
    found_by TEXT,
    confirmed_by TEXT,
    notes TEXT,
    created_at TEXT DEFAULT (datetime('now')),
    updated_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS credentials (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    engagement_id TEXT NOT NULL REFERENCES engagements(id),
    host_id INTEGER REFERENCES hosts(id),
    username TEXT,
    secret TEXT,
    secret_type TEXT,
    domain TEXT,
    source TEXT,
    access_level TEXT,
    valid INTEGER DEFAULT 1,
    notes TEXT,
    found_by TEXT,
    created_at TEXT DEFAULT (datetime('now')),
    UNIQUE(engagement_id, username, domain, secret_type, host_id)
);

CREATE TABLE IF NOT EXISTS chains (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    engagement_id TEXT NOT NULL REFERENCES engagements(id),
    name TEXT NOT NULL,
    score INTEGER,
    status TEXT DEFAULT 'identified',
    steps TEXT,
    mitre_ids TEXT,
    notes TEXT,
    created_at TEXT DEFAULT (datetime('now')),
    updated_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS session_log (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    engagement_id TEXT NOT NULL REFERENCES engagements(id),
    agent TEXT,
    action TEXT,
    summary TEXT,
    detail TEXT,
    created_at TEXT DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_hosts_engagement ON hosts(engagement_id);
CREATE INDEX IF NOT EXISTS idx_vulns_engagement ON vulns(engagement_id);
CREATE INDEX IF NOT EXISTS idx_vulns_severity ON vulns(severity);
CREATE INDEX IF NOT EXISTS idx_vulns_status ON vulns(status);
CREATE INDEX IF NOT EXISTS idx_vulns_cve ON vulns(cve);
CREATE INDEX IF NOT EXISTS idx_vulns_tool_used ON vulns(tool_used);
CREATE INDEX IF NOT EXISTS idx_creds_engagement ON credentials(engagement_id);
CREATE INDEX IF NOT EXISTS idx_chains_engagement ON chains(engagement_id);
CREATE INDEX IF NOT EXISTS idx_session_log_engagement ON session_log(engagement_id);
