----------------------------------
------------ Database ------------
----------------------------------
if not sql.TableExists(darkrp_ls.db) then
    sql.Query([[CREATE TABLE IF NOT EXISTS ]] .. darkrp_ls.db .. [[(
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        player INTEGER NOT NULL,
        plyname VARCHAR(255) NOT NULL,
        level INTEGER NOT NULL DEFAULT 1,
        xp INTEGER NOT NULL DEFAULT 0
    )]])
end