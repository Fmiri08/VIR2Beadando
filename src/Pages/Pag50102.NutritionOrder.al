page 50102 "Nutrition Order"
{
    Caption = 'Nutritient Order';
    PageType = Document;
    SourceTable = "Nutrition Header";

    layout
    {
        area(content)
        {
            group(General)
            {
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
                    Editable = false;
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
            part(Lines; "Nutrition Order Subform")
            {
                SubPageLink = "Nutrition No." = field("Nutrition No.");
                ApplicationArea = All;
            }
        }
    }
}
