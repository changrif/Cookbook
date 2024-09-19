//
//  PreviewMeal.swift
//  Cookbook
//
//  Created by Chandler Griffin on 9/18/24.
//

import Foundation

extension Meal {
    static var preview: Self {
        [Meal].preview.first!
    }
}

extension [Meal] {
    static var preview: Self {
        [
            .init(
                id: "0",
                name: "Bakewell Tart",
                instructions: "To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.\r\nRoll out the dough on a lightly floured work surface and use to line a 20cm/8in flan tin. Leave in the fridge to chill for 30 minutes.\r\nPreheat the oven to 200C/400F/Gas 6 (180C fan).\r\nLine the pastry case with foil and fill with baking beans. Bake blind for about 15 minutes, then remove the beans and foil and cook for a further five minutes to dry out the base.\r\nFor the filing, spread the base of the flan generously with raspberry jam.\r\nMelt the butter in a pan, take off the heat and then stir in the sugar. Add ground almonds, egg and almond extract. Pour into the flan tin and sprinkle over the flaked almonds.\r\nBake for about 35 minutes. If the almonds seem to be browning too quickly, cover the tart loosely with foil to prevent them burning.",
                ingredients: [
                    .init(name: "plain flour", measure: "175g/6oz"),
                    .init(name: "chilled butter", measure: "75g/2½oz"),
                    .init(name: "cold water", measure: "2-3 tbsp"),
                    .init(name: "raspberry jam", measure: "1 tbsp"),
                    .init(name: "butter", measure: "125g/4½oz"),
                    .init(name: "caster sugar", measure: "125g/4½oz"),
                    .init(name: "ground almonds", measure: "125g/4½oz"),
                    .init(name: "free-range egg, beaten", measure: "1"),
                    .init(name: "almond extract", measure: "½ tsp"),
                    .init(name: "flaked almonds", measure: "50g/1¾oz")
                ]
            ),
            .init(
                id: "1",
                name: "Carrot Cake",
                instructions: "For the carrot cake, preheat the oven to 160C/325F/Gas 3. Grease and line a 26cm/10in springform cake tin.\r\nMix all of the ingredients for the carrot cake, except the carrots and walnuts, together in a bowl until well combined. Stir in the carrots and walnuts.\r\nSpoon the mixture into the cake tin and bake for 1 hour 15 minutes, or until a skewer inserted into the middle comes out clean. Remove the cake from the oven and set aside to cool for 10 minutes, then carefully remove the cake from the tin and set aside to cool completely on a cooling rack.\r\nMeanwhile, for the icing, beat the cream cheese, caster sugar and butter together in a bowl until fluffy. Spread the icing over the top of the cake with a palette knife.",
                ingredients: [
                    .init(name: "Vegetable Oil", measure: "450ml"),
                    .init(name: "Plain Flour", measure: "400g"),
                    .init(name: "Bicarbonate Of Soda", measure: "2 tsp"),
                    .init(name: "Sugar", measure: "550ml"),
                    .init(name: "Eggs", measure: "5"),
                    .init(name: "Salt", measure: "½ tsp"),
                    .init(name: "Cinnamon", measure: "2 tsp"),
                    .init(name: "Carrots", measure: "500g grated"),
                    .init(name: "Walnuts", measure: "150g"),
                    .init(name: "Cream Cheese", measure: "200g"),
                    .init(name: "Caster Sugar", measure: "150g"),
                    .init(name: "Butter", measure: "100g")
                ]
            ),
            
        ]
    }
}
