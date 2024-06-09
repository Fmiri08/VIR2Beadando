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
                    Editable = false;
                }
            }
            part(Lines; "Nutrition Order Subform")
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
                    Editable = false;
                }
                field("Total Fat"; Rec."Total Fat")
                {
                    Caption = 'Összes Zsir';
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Total Carbohydrate"; Rec."Total Carbohydrate")
                {
                    Caption = 'Összes Szenhidrat';
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Total kJ"; Rec."Total KJ")
                {
                    Caption = 'Összes kJ';
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Total kcal"; Rec."Total Kcal")
                {
                    Caption = 'Összes kcal';
                    ApplicationArea = All;
                    Editable = false;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Close)
            {
                Caption = 'Lezárás';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    NutritionOrderActions.ChangeNutritionStatus(Rec, Rec.Status::"Lezárt");
                end;
            }
            action(Reopen)
            {
                Caption = 'Újranyitás';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    NutritionOrderActions.ChangeNutritionStatus(Rec, Rec.Status::Nyitott);
                end;
            }
            action("Export")
            {
                Caption = 'Exportálás';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    Xmlport.Run(50100, false, false, Rec);
                end;
            }
            action("Post")
            {
                Caption = 'Könyvelés';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    NutritionOrderActions.PostOrder(Rec);
                end;

            }
        }
    }
    //nézi, hogy nyitott-e, ha igen lehet modósítani
    trigger OnOpenPage()
    begin
        PageEditable := Rec.Status = Rec.Status::Nyitott;
        CurrPage.Editable(PageEditable)
    end;

    var
        PageEditable: Boolean;
        NutritionOrderActions: Codeunit NutritionOrderActions;
}
