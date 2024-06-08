codeunit 50100 NutritionOrderActions
{
    procedure ChangeNutritionStatus(
        NutritionHeader: Record "Nutrition Header";
        Status: Enum Status
    )
    begin
        NutritionHeader.TestField(NutritionHeader.Date);
        NutritionHeader.Status := Status;
        NutritionHeader.Modify();
    end;

    procedure PostOrder(var NutritionHeader: Record "Nutrition Header")
    var
        NutritionLine: Record "Nutrition Line";
        PNH: Record "Posted Nutrition Header";
        PNL: Record "Posted Nutrition Line";
        Siker: Label 'Könyvelve';
        Post: Label 'Biztosan könyvelni szeretné a dokumentumot?';
        Delete: Label 'Szeretné törölni a dokumentumot könyvelés után?';
        ShouldBeDeleted: Boolean;

    begin
        NutritionHeader.TestField(Status, NutritionHeader.Status::"Lezárt");

        if not Confirm(Post) then
            exit;

        if Confirm(Delete) then
            ShouldBeDeleted := true
        else
            ShouldBeDeleted := false;

        PNH.Init();
        PNH.TransferFields(NutritionHeader);
        PNH."Nutrition No." := NutritionHeader."Nutrition No.";
        PNH.Insert(true);

        NutritionLine.Reset();
        NutritionLine.SetRange("Nutrition No.", NutritionHeader."Nutrition No.");
        if NutritionLine.findSet() then
            repeat
                PNL.Init();
                PNL.TransferFields(NutritionLine);
                PNL."Nutrition No." := PNH."Nutrition No.";
                PNL.Insert(true);

                if ShouldBeDeleted then
                    NutritionLine.Delete();
            until NutritionLine.Next() = 0;

        if ShouldBeDeleted then
            NutritionHeader.Delete();

        Commit();
        Message(Siker);
        Page.RunModal(Page::"Posted Nutrition Order", PNH);
    end;
}
