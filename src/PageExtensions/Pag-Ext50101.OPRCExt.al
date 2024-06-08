pageextension 50101 OPRC_Ext extends "Order Processor Role Center"
{

    actions
    {
        addafter("Sales Orders")
        {
            action(Macronutrients)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Macronutrients';
                Image = "Order";
                RunObject = Page "Macronutrients";
                ToolTip = 'Tápanyagok';
            }
            action(NutritionOrder)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Nutrition Order';
                Image = "Order";
                RunObject = Page "Nutrition Order List";
                ToolTip = 'Táplalkozasok';
            }
            action(PostedNutritionOrder)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Nutrition Order';
                Image = "Order";
                RunObject = Page "Posted Nutrition Order List";
                ToolTip = 'Könyvelt Táplalkozasok';
            }
        }
    }
}
