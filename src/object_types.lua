SMODS.ObjectType {
    key = 'Ingredient',
    default = 'i_cc_adder',
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
        --self:inject_card(G.P_CENTERS.i_cc_adder)
    end,
}