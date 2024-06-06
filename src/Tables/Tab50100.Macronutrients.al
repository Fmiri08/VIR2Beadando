table 50100 Macronutrients
{
    Caption = 'Macronutrients';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; Protein; Integer)
        {
            Caption = 'Protein';
            DataClassification = CustomerContent;
        }
        field(4; Fat; Integer)
        {
            Caption = 'Fat';
            DataClassification = CustomerContent;
        }
        field(5; Carbohydrate; Integer)
        {
            Caption = 'Carbohydrate';
            DataClassification = CustomerContent;
        }
        field(6; Unit; Text[10])
        {
            Caption = 'Unit';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }
        field(7; "Energy (KJ)"; Integer)
        {
            Caption = 'Energy (KJ)';
            DataClassification = CustomerContent;
        }
        field(8; "Energy (Kcal)"; Integer)
        {
            Caption = 'Energy (Kcal)';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
