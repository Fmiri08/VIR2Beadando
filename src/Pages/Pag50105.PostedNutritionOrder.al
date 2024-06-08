page 50105 "Posted Nutrition Order"
{
    Caption = 'Posted Nutrition Order';
    PageType = Document;
    SourceTable = "Posted Nutrition Header";
    Editable = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Nutrition No."; Rec."Nutrition No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Code"; Rec."Customer Code")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
            part(Lines; "Posted Nutrition Order Subform")
            {
                SubPageLink = "Nutrition No." = field("Nutrition No.");
                ApplicationArea = All;
            }
            group(Osszesen)
            {
                field("Total Protein"; Rec."Total Protein")
                {
                    Caption = 'Összes Protein';
                    ApplicationArea = All;
                }
                field("Total Fat"; Rec."Total Fat")
                {
                    Caption = 'Összes Zsir';
                    ApplicationArea = All;
                }
                field("Total Carbohydrate"; Rec."Total Carbohydrate")
                {
                    Caption = 'Összes Szenhidrat';
                    ApplicationArea = All;
                }
                field("Total kJ"; Rec."Total KJ")
                {
                    Caption = 'Összes kJ';
                    ApplicationArea = All;
                }
                field("Total kcal"; Rec."Total Kcal")
                {
                    Caption = 'Összes kcal';
                    ApplicationArea = All;
                }
            }
        }
    }
}

