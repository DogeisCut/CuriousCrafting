local game_start_run_ref = Game.start_run
function Game:start_run(args)
    self.cc_ingredients_area = CardArea(
        0,
        0,
        self.CARD_W * 4.95,
        self.CARD_H * 0.95,
        {
            card_limit = 5,
            type = 'extra_deck',
            highlight_limit = 1,
        }
    )
    CC.cc_ingredients_area = G.cc_ingredients_area

    game_start_run_ref(self, args)

    CC.cc_ingredients_area.config.card_limit = self.GAME.modifiers["cc_ingredients_area_slots"] or
        C.cc_ingredients_area.config.card_limit or 16

    self.cc_ingredients = UIBox {
        definition = CC.create_UIBox_ingredients(),
        config = { align = 'cmi', offset = { x = 2.4, y = -5 }, major = self.jokers, bond = 'Weak' }
    }
    self.cc_ingredients.states.visible = false
    G.GAME.cc_show_ingredients = G.GAME.cc_show_ingredients or false

    CC.ingredients_open = false
    CC.ingredients_forced = false
end