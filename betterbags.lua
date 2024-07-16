---@class BetterBags: AceAddon
local addon = LibStub("AceAddon-3.0"):GetAddon("BetterBags")

---@class Categories: AceModule
local categories = addon:GetModule("Categories")

-- Localization table
local locales = {
    ["enUS"] = {
        ["AddBags"] = "DF",
    },
}

-- Detects current language
local currentLocale = GetLocale()

-- Function to get the translation
local function L(key)
    return locales[currentLocale] and locales[currentLocale][key] or locales["enUS"][key]
end

-- items
local AddBags = {
    207026,
    192055,
    213089,
    224298,
}

--We make sure that category names and content are always up to date.
local CategoriesToUpdate = {
    "AddBags",
}

for _, category in ipairs(CategoriesToUpdate) do
    categories:DeleteCategory(category)
end  

local color_offwhite = "FFDCC1"
local color_aqua = "00FFC0"
local colorPrefix = "|cff" .. color_aqua
local resetColor = "|r"

for _, ItemID in pairs(AddBags) do
    categories:AddItemToCategory(ItemID, colorPrefix .. L("AddBags") .. resetColor)
end