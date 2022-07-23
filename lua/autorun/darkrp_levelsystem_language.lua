if GAMEMODE_NAME != "darkrp" then return end

-- https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes

CreateConVar("darkrp_ls_lang", "en", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "The language to use for the level system.")
local lang = GetConVar("darkrp_ls_lang")
local lang_table = {
    ["en"] = "english",
    ["es"] = "spanish"
}

function DLS_GetLanguage(phrase)
    local language = lang_table[lang:GetString()] or "english"
    return darkrp_ls.language[language][phrase] or phrase
end