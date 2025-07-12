SMODS.ObjectType {
    key = 'Ingredient',
    default = 'cc_i_adder',
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
        self:inject_card(G.P_CENTERS.cc_i_adder)
    end,
}