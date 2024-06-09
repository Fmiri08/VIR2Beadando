codeunit 50100 NutritionOrderActions
{
    procedure ChangeNutritionStatus(
        NutritionHeader: Record "Nutrition Header";
        Status: Enum Status)
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

        // Könyvelni akarja-e a felhasználó
        if not Confirm(Post) then
            exit;

        //Törölni akarja-e könyvelés után az adatot a felhasználó
        if Confirm(Delete) then
            ShouldBeDeleted := true
        else
            ShouldBeDeleted := false;

        //Létrehozunk egy új PostedNutritionHeader-t,
        PNH.Init();
        //és átmásoljuk a mezőket a Nutrition Header-ből
        PNH.TransferFields(NutritionHeader);
        PNH."Nutrition No." := NutritionHeader."Nutrition No.";
        PNH.Insert(true);

        //Kikeressük a Nutrition Line-ok közül azokat, amik a megadott Nutrition Header-höz tartozik
        NutritionLine.Reset();
        NutritionLine.SetRange("Nutrition No.", NutritionHeader."Nutrition No.");
        if NutritionLine.findSet() then
            repeat
                //ha vannak ilyenek, akkor hasonlóan az előzőekhez, átmásoljuk őket egyessével, amíg vannak
                PNL.Init();
                PNL.TransferFields(NutritionLine);
                PNL."Nutrition No." := PNH."Nutrition No.";
                PNL.Insert(true);

                //ha törölni akarjuk őket, akkor törlünk
                if ShouldBeDeleted then
                    NutritionLine.Delete();
            until NutritionLine.Next() = 0;

        // ha törölni akarjuk az adatot, akkor itt töröljük a Nutrition Header-t
        if ShouldBeDeleted then
            NutritionHeader.Delete();

        //adatbázishoz adás
        Commit();
        Message(Siker);
        Page.RunModal(Page::"Posted Nutrition Order", PNH);
    end;
}
