table 50103 "Posted Nutrition Header"
{
    Caption = 'Könyvelt táplálkozás';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Nutrition No."; Code[20])
        {
            Caption = 'Nutrition No.';
        }
        field(2; "Customer Code"; Text[10])
        {
            Caption = 'Customer Code';
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.Get("Customer Code") then
                    Rec."Customer Name" := Customer.Name
                else
                    Rec."Customer Name" := '';
            end;
        }
        field(3; "Customer Name"; Text[50])
        {
            Caption = 'Customer Name';
            TableRelation = Customer.Name;
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(5; Status; Enum Status)
        {
            Caption = 'Status';
        }
        field(6; "Total Protein"; Integer)
        {
            Caption = 'Osszes Protein';
            FieldClass = FlowField;
            CalcFormula = Sum("Posted Nutrition Line".Protein Where("Nutrition No." = field("Nutrition No.")));
        }
        field(7; "Total Fat"; Integer)
        {
            Caption = 'Osszes Zsir';
            FieldClass = FlowField;
            CalcFormula = Sum("Posted Nutrition Line".Fat Where("Nutrition No." = field("Nutrition No.")));
        }
        field(8; "Total Carbohydrate"; Integer)
        {
            Caption = 'Osszes Szenhidrat';
            FieldClass = FlowField;
            CalcFormula = Sum("Posted Nutrition Line".Carbohydrate Where("Nutrition No." = field("Nutrition No.")));
        }
        field(9; "Total KJ"; Integer)
        {
            Caption = 'Osszes kJ';
            FieldClass = FlowField;
            CalcFormula = Sum("Posted Nutrition Line".KJ Where("Nutrition No." = field("Nutrition No.")));
        }
        field(10; "Total Kcal"; Integer)
        {
            Caption = 'Osszes kcal';
            FieldClass = FlowField;
            CalcFormula = Sum("Posted Nutrition Line".Kcal Where("Nutrition No." = field("Nutrition No.")));
        }
    }
    keys
    {
        key(PK; "Nutrition No.")
        {
            Clustered = true;
        }
    }
}
