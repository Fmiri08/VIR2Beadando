page 50101 "Macronutrients Card"
{
    Caption = 'Macronutrients Card';
    PageType = Card;
    SourceTable = Macronutrients;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'A makronutriens kódja.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'A makronutriens leírása.';
                }
                field(Protein; Rec.Protein)
                {
                    ApplicationArea = All;
                    ToolTip = 'A makronutriens fehérje tartalma grammban.';
                }
                field(Fat; Rec.Fat)
                {
                    ApplicationArea = All;
                    ToolTip = 'A makronutriens zsírtartalm grammban.';
                }
                field(Carbohydrate; Rec.Carbohydrate)
                {
                    ApplicationArea = All;
                    ToolTip = 'A makronutriens szénhidrát tartalma.';
                }
                field(Unit; Rec.Unit)
                {
                    ApplicationArea = All;
                    ToolTip = 'A makronutriens megadásakor használható mértékegysége.';
                }
                field("Energy (KJ)"; Rec."Energy (KJ)")
                {
                    ApplicationArea = All;
                    ToolTip = 'A makronutriens energiatartalma (KJ).';
                }
                field("Energy (Kcal)"; Rec."Energy (Kcal)")
                {
                    ApplicationArea = All;
                    ToolTip = 'A makronutriens energiatartalma (Kcal).';
                }
            }
        }
    }
}
