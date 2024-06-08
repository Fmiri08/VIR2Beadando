xmlport 50100 XMLExport
{
    Caption = 'XMLExport';
    schema
    {
        textelement("Táplálkozás")
        {
            tableelement(NutritionHeader; "Nutrition Header")
            {
                fieldelement(NutritionNo; NutritionHeader."Nutrition No.")
                {
                }
                fieldelement(CustomerCode; NutritionHeader."Customer Code")
                {
                }
                fieldelement(CustomerName; NutritionHeader."Customer Name")
                {
                }
                fieldelement(Date; NutritionHeader."Date")
                {
                }
                fieldelement(Status; NutritionHeader.Status)
                {
                }
                fieldelement(TotalCarbohydrate; NutritionHeader."Total Carbohydrate")
                {
                }
                fieldelement(TotalFat; NutritionHeader."Total Fat")
                {
                }
                fieldelement(TotalProtein; NutritionHeader."Total Protein")
                {
                }
                fieldelement(TotalKJ; NutritionHeader."Total KJ")
                {
                }
                fieldelement(TotalKcal; NutritionHeader."Total Kcal")
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
