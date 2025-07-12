CC = {}

CC.RecipeTags = {}
G.recipetaglist = {}
-- should extend off GameObject but that is giving me an error so it will be a Center for now
CC.RecipeTag = SMODS.Center:extend {
    obj_table = CC.Recipes,
    obj_buffer = G.recipetaglist,
    class_prefix = 'rt',
    set = 'RecipeTag',
    required_params = {
        'key',
        'contains' -- A function that returns a table of keys that this RecipeTag contains. Has arguments for self.
    },
    process_loc_text = function(self)
        SMODS.process_loc_text(G.localization.misc.recipe_tags, self.key, self.loc_txt, 'name')
        SMODS.process_loc_text(G.localization.misc.recipe_tag_descriptions, self.key, self.loc_txt, 'description')
    end,
    inject_class = function() end,
    inject = function(self) end,
    register = function(self)
        if self:check_dependencies() and not self.obj_table[self.key] then
            self.contains = self.contains
            self.obj_table[self.key] = self
            self.obj_buffer[#self.obj_buffer + 1] = self.key
        end
    end,
}

CC.Recipes = {}
G.recipelist = {}
CC.Recipe = SMODS.GameObject:extend {
    obj_table = CC.Recipes,
    obj_buffer = G.recipelist,
    shapeless = false,
    icon = '',
    class_prefix = 'rp',
    on_result = function(self, cards)
    end,
    on_result_pickup = function(self, cards)
    end,
    required_params = {
        'key',
        'pattern', -- A table of strings representing the 3x3 crafting grid.
        'crafting_keys', -- A table containing what each letter in the pattern represents
        'results' -- A function that returns a table of keys representing the result. Has arguments for self and the current crafting state.
    },
    set = 'Recipe',
    process_loc_text = function(self)
        SMODS.process_loc_text(G.localization.misc.recipes, self.key, self.loc_txt, 'name')
        SMODS.process_loc_text(G.localization.misc.recipe_descriptions, self.key, self.loc_txt, 'description')
    end,
    register = function(self)
        if self:check_dependencies() and not self.obj_table[self.key] then
            self.shapeless = self.shapeless
            self.pattern = self.pattern
            self.crafting_keys = self.crafting_keys
            self.results = self.results
            self.icon = self.icon
            if self.icon == nil then
                 self.icon = self.results[1]
            end
            self.on_result = self.on_result
            self.on_result_pickup = self.on_result_pickup
            self.obj_table[self.key] = self
            self.obj_buffer[#self.obj_buffer + 1] = self.key
        end
    end,
    inject = function(self) end,
}

CC.Ingredient = SMODS.Center:extend {
    required_params = {
        'key',
    },
    atlas = 'cc_ingredients',
    pos = { x = 0, y = 0 },
    config = {},
    cost = 2,
    class_prefix = 'i',
    inject = function(self)
        SMODS.Center.inject(self)
        --SMODS.insert_pool(G.P_CENTER_POOLS['Ingredient'], self)
    end
}
