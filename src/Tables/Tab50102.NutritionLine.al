table 50102 "Nutrition Line"
{
    Caption = 'Nutrition Line';
    DataClassification = CustomerContent;
    LookupPageId = "Nutrition Order Subform";
    DrillDownPageId = "Nutrition Order Subform";

    fields
    {
        field(1; "Nutrition No."; Code[20])
        {
            Caption = 'Nutrition No.';
            TableRelation = "Nutrition Header"."Nutrition No.";
            Editable = false;
        }
        field(2; "Serial No."; Integer)
        {
            Caption = 'Sorszám';
        }
        field(3; "Nutrition Code"; Code[10])
        {
            Caption = 'Tápanyag kód';
            TableRelation = Macronutrients.Code;
            ValidateTableRelation = true;

            trigger OnLookup()
            var
                Macronutrient: Record Macronutrients;
            begin
                Page.RunModal(Page::"Macronutrients", Macronutrient)
            end;

            trigger OnValidate()
            var
                Nutrient: Record Macronutrients;
            begin
                if Nutrient.Get(Rec."Nutrition Code") then begin
                    Rec.Description := Nutrient.Description;
                    Rec."Unit of Measure" := Nutrient.Unit;
                    Rec.Protein := Nutrient.Protein * Quantity;
                    Rec.Fat := Nutrient.Fat * Quantity;
                    Rec.Carbohydrate := Nutrient.Carbohydrate * Quantity;
                    Rec."KJ" := Nutrient."Energy (KJ)" * Quantity;
                    Rec."Kcal" := Nutrient."Energy (Kcal)" * Quantity;
                end
                else begin
                    Rec."Description" := '';
                    Rec."Unit of Measure" := '';
                    Rec.Protein := 0;
                    Rec.Fat := 0;
                    Rec.Carbohydrate := 0;
                    Rec."KJ" := 0;
                    Rec."Kcal" := 0;
                end;
            end;
        }
        field(4; Description; Text[50])
        {
            Caption = 'Leírás';
        }
        field(5; Quantity; Integer)
        {
            Caption = 'Mennyiség';

            trigger OnValidate()
            var
                Macronutrient: Record Macronutrients;
            begin
                if Macronutrient.Get(Rec."Nutrition Code") then begin
                    Rec.Protein := Macronutrient.Protein * Quantity;
                    Rec.Fat := Macronutrient.Fat * Quantity;
                    Rec.Carbohydrate := Macronutrient.Carbohydrate * Quantity;
                    Rec."KJ" := Macronutrient."Energy (KJ)" * Quantity;
                    Rec."Kcal" := Macronutrient."Energy (Kcal)" * Quantity;
                end
                else begin
                    Rec.Protein := 0;
                    Rec.Fat := 0;
                    Rec.Carbohydrate := 0;
                    Rec."KJ" := 0;
                    Rec."Kcal" := 0;
                end
            end;
        }
        field(6; "Unit of Measure"; Code[10])
        {
            Caption = 'Mértékegység';
            Editable = false;
        }
        field(7; Protein; Integer)
        {
            Caption = 'Protein';
        }
        field(8; Fat; Integer)
        {
            Caption = 'Zsír';
        }
        field(9; Carbohydrate; Integer)
        {
            Caption = 'Szénhidrát';
        }
        field(10; KJ; Integer)
        {
            Caption = 'Energia (KJ)';
        }
        field(11; Kcal; Integer)
        {
            Caption = 'Energia (Kcal)';
        }

    }
    keys
    {
        key(PK; "Nutrition No.", "Serial No.")
        {
            Clustered = true;
        }
    }
}
