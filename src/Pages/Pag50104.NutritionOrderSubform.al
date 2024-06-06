page 50104 "Nutrition Order Subform"
{
    Caption = 'Nutrition Order Subform';
    PageType = ListPart;
    SourceTable = "Nutrition Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Nutrition No."; Rec."Nutrition No.")
                {
                    ApplicationArea = All;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = All;
                }
                field("Nutrition Code"; Rec."Nutrition Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                }
                field(Protein; Rec.Protein)
                {
                    ApplicationArea = All;
                }
                field(Fat; Rec.Fat)
                {
                    ApplicationArea = All;
                }
                field(Carbohydrate; Rec.Carbohydrate)
                {
                    ApplicationArea = All;
                }
                field(KJ; Rec.KJ)
                {
                    ApplicationArea = All;
                }
                field(Kcal; Rec.Kcal)
                {
                    ApplicationArea = All;
                }
            }
            group(Osszesen)
            {
                field("Total Protein"; Rec.Protein)
                {
                    Caption = 'Összes Protein';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Total Fat"; Rec.Fat)
                {
                    Caption = 'Összes Zsir';
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Total Carbohydrate"; Rec.Carbohydrate)
                {
                    Caption = 'Összes Szenhidrat';
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Total kJ"; Rec.KJ)
                {
                    Caption = 'Összes kJ';
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Total kcal"; Rec.Kcal)
                {
                    Caption = 'Összes kcal';
                    ApplicationArea = All;
                    Editable = false;

                }
            }
        }
    }
}
