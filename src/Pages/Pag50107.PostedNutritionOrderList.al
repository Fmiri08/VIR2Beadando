page 50107 "Posted Nutrition Order List"
{
    ApplicationArea = All;
    Caption = 'Posted Nutrition Order List';
    PageType = List;
    Editable = false;
    SourceTable = "Posted Nutrition Header";
    UsageCategory = Lists;
    CardPageId = "Posted Nutrition Order";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Nutrition No."; Rec."Nutrition No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nutrition No. field.';
                }
                field("Customer Code"; Rec."Customer Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Code field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}
