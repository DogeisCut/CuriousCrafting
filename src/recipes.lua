CC.RecipeTag {
    key = "any_joker",
    contains = function(self)
        -- todo: return all joker keys
        return {
            {key = "j_joker", set = 'Joker', edition = nil, enhancement = nil, seal = nil, stickers = nil}
        }
    end
}

CC.Recipe {
    key = "calcification",
    shapeless = true,
    pattern = {
        "JTT",
        "   ",
        "   "
    },
    crafting_keys = {
        ["J"] = {key = "rt_cc_any_joker", set = 'RecipeTag'},
        ["T"] = {key = "c_tower", set = 'Tarot', edition = nil, enhancement = nil, seal = nil, stickers = nil},
    },
    results = function(self, crafting_state)
        return { "j_stone" }
    end,
    icon = "j_stone",
    loc_vars = function(self, info_queue, card)
        return { vars = { 
            localize { type = "name_text", set = "RecipeTag", key = self.crafting_keys["J"]},
            localize { type = "name_text", set = "Joker", key = self.crafting_keys["T"]},
            localize { type = "name_text", set = "Joker", key = self.results[1]},
            #self.results
     } }
    end,
    on_result = function(self, cards)
    end,
    on_result_pickup = function(self, cards)
    end,
}

CC.Recipe {
    key = "adder",
    shapeless = true,
    pattern = {
        "PAP",
        "   ",
        "   "
    },
    crafting_keys = {
        ["P"] = {key = "rt_cc_any_playing_card", set = 'RecipeTag'},
        ["A"] = {key = "cc_i_add", set = 'Ingredient', edition = nil, enhancement = nil, seal = nil, stickers = nil},
    },
    results = function(self, crafting_state)
        local res = {}
        -- get playing cards from crafting state and add them, cap out at aces
        return res
    end,
    icon = "cc_i_add",
    loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end,
    on_result = function(self, cards)
    end,
    on_result_pickup = function(self, cards)
    end,
}

