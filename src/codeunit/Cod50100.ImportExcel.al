codeunit 50100 "Import Excel"
{
    trigger OnRun()
    begin

    end;
    //ReadExcelSheet
    //GetValueAtCell
    //ImportSummarySalesbyInvoice
    //ImportSummarySalebyDay
    //ImportSaleSumarybyinvoice
    //SummarySalesbyInvoiceCheckduplicate
    //SaleSumarybyinvoiceCheckduplicate
    //ImportSaleVATEntriesbyInvoice
    //ImportSaleVATEntriesbyDays
    procedure ReadExcelSheet()
    var
        FileMgt: Codeunit "File Management";
        IStream: InStream;
        FromFile: Text[100];
    begin
        UploadIntoStream(UploadExcelMsg, '', '', FromFile, IStream);
        if FromFile <> '' then begin
            FileName := FileMgt.GetFileName(FromFile);
            SheetName := TempExcelBuffer.SelectSheetsNameStream(IStream);
        end else
            Error(NoFileFoundMsg);
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(IStream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin

        TempExcelBuffer.Reset();
        If TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

    local procedure SummarySalesbyInvoiceCheckduplicate(SaleInvoiceNo: Code[20]): Boolean
    var
        SumSalesbyInv: Record "Summary Sales by Invoice";
    begin
        SumSalesbyInv.Reset();
        SumSalesbyInv.SetRange("Sale Invoice No.", SaleInvoiceNo);
        if SumSalesbyInv.FindSet() then
            exit(true)
        else
            exit(false);
    end;

    local procedure SaleSumarybyinvoiceCheckduplicate(BillNo: Code[20]): Boolean
    var
        SaleSumarybyInv: Record "Sale Sumary by invoice";
    begin
        SaleSumarybyInv.Reset();
        SaleSumarybyInv.SetRange("Bill No.", BillNo);
        if SaleSumarybyInv.FindSet() then
            exit(true)
        else
            exit(false);
    end;

    procedure ImportSummarySalesbyInvoice()
    var
        SumSalesbyInv: Record "Summary Sales by Invoice";
        RowNo: Integer;
        ColNo: Integer;
        EntryNo: Integer;
        MaxRowNo: Integer;
        SellingPrice: Decimal;
        Discount: Decimal;
        TotalAmount: Decimal;
        SC: Decimal;
        GrandTotal: Decimal;
        AmountBeforeVAT: Decimal;
        SaleVATAmount: Decimal;
        Cash: Decimal;
        CreditCard: Decimal;
        Delivery: Decimal;
        GrabCredit: Decimal;
        LineMan: Decimal;
        HDCash: Decimal;
        HDCredit: Decimal;
        Robinhood: Decimal;
        SCBQR: Decimal;
        SPFCredit: Decimal;
        PaymentAmount: Decimal;
        DifferenceAmount: Decimal;
        AveragePerBill: Decimal;
        AveragePerCapita: Decimal;
        Customer: Integer;
        VARDate: Text;
        x: Integer;
        Text001: Label 'Sale Invoice No.::%1 is Duplicate';
    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        SellingPrice := 0;
        Discount := 0;
        TotalAmount := 0;
        GrandTotal := 0;
        AmountBeforeVAT := 0;
        SaleVATAmount := 0;
        Cash := 0;
        SC := 0;
        CreditCard := 0;
        Delivery := 0;
        GrabCredit := 0;
        LineMan := 0;
        HDCash := 0;
        HDCredit := 0;
        Robinhood := 0;
        SCBQR := 0;
        SPFCredit := 0;
        PaymentAmount := 0;
        DifferenceAmount := 0;
        AveragePerBill := 0;
        AveragePerCapita := 0;
        Customer := 0;
        x := 0;
        Clear(VARDate);
        SumSalesbyInv.Reset();
        if SumSalesbyInv.FindLast() then
            EntryNo := SumSalesbyInv."Entry No.";
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRowNo := TempExcelBuffer."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            SumSalesbyInv.Init();
            SumSalesbyInv."Entry No." := EntryNo;
            if x = 0 then begin
                VARDate := GetValueAtCell(RowNo, 1);
                x += 1;
            end;
            if not (VARDate = GetValueAtCell(RowNo, 1)) then
                Error('Date must have a value equle %1', VARDate);
            Evaluate(SumSalesbyInv."Date", GetValueAtCell(RowNo, 1));

            if SummarySalesbyInvoiceCheckduplicate(GetValueAtCell(RowNo, 2)) = true then
                Error(Text001, GetValueAtCell(RowNo, 2));

            Evaluate(SumSalesbyInv."Sale Invoice No.", GetValueAtCell(RowNo, 2));
            Evaluate(SumSalesbyInv."Sale Mode", GetValueAtCell(RowNo, 3));
            Evaluate(SumSalesbyInv."Table - Queue", GetValueAtCell(RowNo, 4));

            if GetValueAtCell(RowNo, 5) = '' then begin
                Customer := 0;
                Evaluate(SumSalesbyInv.Customer, Format(Customer));
            end else begin
                Evaluate(SumSalesbyInv.Customer, GetValueAtCell(RowNo, 5));
            end;

            if (GetValueAtCell(RowNo, 6) = '-') or (GetValueAtCell(RowNo, 6) = '') then begin
                SellingPrice := 0;
                Evaluate(SumSalesbyInv."Selling Price", Format(SellingPrice));
            end else begin
                Evaluate(SumSalesbyInv."Selling Price", GetValueAtCell(RowNo, 6));
            end;

            if (GetValueAtCell(RowNo, 7) = '-') or (GetValueAtCell(RowNo, 7) = '') then begin
                Discount := 0;
                Evaluate(SumSalesbyInv.Discount, Format(Discount));
            end else begin
                Evaluate(SumSalesbyInv.Discount, GetValueAtCell(RowNo, 7));
            end;

            if (GetValueAtCell(RowNo, 8) = '-') or (GetValueAtCell(RowNo, 8) = '') then begin
                TotalAmount := 0;
                Evaluate(SumSalesbyInv."Total Amount", Format(TotalAmount));
            end else begin
                Evaluate(SumSalesbyInv."Total Amount", GetValueAtCell(RowNo, 8));
            end;

            if (GetValueAtCell(RowNo, 9) = '-') or (GetValueAtCell(RowNo, 9) = '') then begin
                SC := 0;
                Evaluate(SumSalesbyInv.SC, Format(SC));
            end else begin
                Evaluate(SumSalesbyInv.SC, GetValueAtCell(RowNo, 9));
            end;

            if (GetValueAtCell(RowNo, 10) = '-') or (GetValueAtCell(RowNo, 10) = '') then begin
                GrandTotal := 0;
                Evaluate(SumSalesbyInv."Grand Total", Format(GrandTotal));
            end else begin
                Evaluate(SumSalesbyInv."Grand Total", GetValueAtCell(RowNo, 10));
            end;

            if (GetValueAtCell(RowNo, 11) = '-') or (GetValueAtCell(RowNo, 11) = '') then begin
                AmountBeforeVAT := 0;
                Evaluate(SumSalesbyInv."Amount Before VAT", Format(AmountBeforeVAT));
            end else begin
                Evaluate(SumSalesbyInv."Amount Before VAT", GetValueAtCell(RowNo, 11));
            end;

            if (GetValueAtCell(RowNo, 12) = '-') or (GetValueAtCell(RowNo, 12) = '') then begin
                SaleVATAmount := 0;
                Evaluate(SumSalesbyInv."Sale VAT Amount", Format(SaleVATAmount));
            end else begin
                Evaluate(SumSalesbyInv."Sale VAT Amount", GetValueAtCell(RowNo, 12));
            end;

            if (GetValueAtCell(RowNo, 13) = '-') or (GetValueAtCell(RowNo, 13) = '') then begin
                Cash := 0;
                Evaluate(SumSalesbyInv.Cash, Format(Cash));
            end else begin
                Evaluate(SumSalesbyInv.Cash, GetValueAtCell(RowNo, 13));
            end;

            if (GetValueAtCell(RowNo, 14) = '-') or (GetValueAtCell(RowNo, 14) = '') then begin
                CreditCard := 0;
                Evaluate(SumSalesbyInv."Credit Card", Format(CreditCard));
            end else begin
                Evaluate(SumSalesbyInv."Credit Card", GetValueAtCell(RowNo, 14));
            end;

            if (GetValueAtCell(RowNo, 15) = '-') or (GetValueAtCell(RowNo, 15) = '') then begin
                Delivery := 0;
                Evaluate(SumSalesbyInv."Delivery", Format(Delivery));
            end else begin
                Evaluate(SumSalesbyInv."Delivery", GetValueAtCell(RowNo, 15));
            end;

            if (GetValueAtCell(RowNo, 16) = '-') or (GetValueAtCell(RowNo, 16) = '') then begin
                GrabCredit := 0;
                Evaluate(SumSalesbyInv."Grab Credit", Format(GrabCredit));
            end else begin
                Evaluate(SumSalesbyInv."Grab Credit", GetValueAtCell(RowNo, 16));
            end;

            if (GetValueAtCell(RowNo, 17) = '-') or (GetValueAtCell(RowNo, 17) = '') then begin
                LineMan := 0;
                Evaluate(SumSalesbyInv."Line Man (Credit)", Format(LineMan));
            end else begin
                Evaluate(SumSalesbyInv."Line Man (Credit)", GetValueAtCell(RowNo, 17));
            end;

            if (GetValueAtCell(RowNo, 18) = '-') or (GetValueAtCell(RowNo, 18) = '') then begin
                HDCash := 0;
                Evaluate(SumSalesbyInv."HD (Cash)", Format(HDCash));
            end else begin
                Evaluate(SumSalesbyInv."HD (Cash)", GetValueAtCell(RowNo, 18));
            end;

            if (GetValueAtCell(RowNo, 19) = '-') or (GetValueAtCell(RowNo, 19) = '') then begin
                HDCredit := 0;
                Evaluate(SumSalesbyInv."HD (Credit)", Format(HDCredit));
            end else begin
                Evaluate(SumSalesbyInv."HD (Credit)", GetValueAtCell(RowNo, 19));
            end;

            if (GetValueAtCell(RowNo, 20) = '-') or (GetValueAtCell(RowNo, 20) = '') then begin
                Robinhood := 0;
                Evaluate(SumSalesbyInv.Robinhood, Format(Robinhood));
            end else begin
                Evaluate(SumSalesbyInv.Robinhood, GetValueAtCell(RowNo, 20));
            end;

            if (GetValueAtCell(RowNo, 21) = '-') or (GetValueAtCell(RowNo, 21) = '') then begin
                SCBQR := 0;
                Evaluate(SumSalesbyInv."SCB QR", Format(SCBQR));
            end else begin
                Evaluate(SumSalesbyInv."SCB QR", GetValueAtCell(RowNo, 21));
            end;

            if (GetValueAtCell(RowNo, 22) = '-') or (GetValueAtCell(RowNo, 22) = '') then begin
                SPFCredit := 0;
                Evaluate(SumSalesbyInv."SPF Credit", Format(SPFCredit));
            end else begin
                Evaluate(SumSalesbyInv."SPF Credit", GetValueAtCell(RowNo, 22));
            end;

            if (GetValueAtCell(RowNo, 23) = '-') or (GetValueAtCell(RowNo, 23) = '') then begin
                PaymentAmount := 0;
                Evaluate(SumSalesbyInv."Payment Amount", Format(PaymentAmount));
            end else begin
                Evaluate(SumSalesbyInv."Payment Amount", GetValueAtCell(RowNo, 23));
            end;

            if (GetValueAtCell(RowNo, 24) = '-') or (GetValueAtCell(RowNo, 24) = '') then begin
                DifferenceAmount := 0;
                Evaluate(SumSalesbyInv."Difference Amount", Format(DifferenceAmount));
            end else begin
                Evaluate(SumSalesbyInv."Difference Amount", GetValueAtCell(RowNo, 24));
            end;

            if (GetValueAtCell(RowNo, 25) = '-') or (GetValueAtCell(RowNo, 25) = '') then begin
                AveragePerBill := 0;
                Evaluate(SumSalesbyInv."Average Per Bill", Format(AveragePerBill));
            end else begin
                Evaluate(SumSalesbyInv."Average Per Bill", GetValueAtCell(RowNo, 25));
            end;

            if (GetValueAtCell(RowNo, 26) = '-') or (GetValueAtCell(RowNo, 26) = '') then begin
                AveragePerCapita := 0;
                Evaluate(SumSalesbyInv."Average Per Capita", Format(AveragePerCapita));
            end else begin
                Evaluate(SumSalesbyInv."Average Per Capita", GetValueAtCell(RowNo, 26));
            end;
            SumSalesbyInv."Sheet Name" := SheetName;
            SumSalesbyInv."File Name" := FileName;
            SumSalesbyInv."Imported Date" := Today;
            SumSalesbyInv."Imported Time" := Time;
            SumSalesbyInv.Insert();
        end;
        Message(ExcelImportSucess);
    end;

    procedure ImportSummarySalebyDay()
    var
        SumSalebyDay: Record "Summary Sale by Day";
        RowNo: Integer;
        ColNo: Integer;
        EntryNo: Integer;
        MaxRowNo: Integer;
        SellingPrice: Decimal;
        Discount: Decimal;
        TotalAmount: Decimal;
        SC: Decimal;
        GrandTotal: Decimal;
        AmountBeforeVAT: Decimal;
        SaleVATAmount: Decimal;
        Cash: Decimal;
        CreditCard: Decimal;
        Delivery: Decimal;
        GrabCredit: Decimal;
        LineMan: Decimal;
        HDCash: Decimal;
        HDCredit: Decimal;
        Robinhood: Decimal;
        SCBQR: Decimal;
        SPFCredit: Decimal;
        PaymentAmount: Decimal;
        DifferenceAmount: Decimal;
        AveragePerBill: Decimal;
        AveragePerCapita: Decimal;
        KTC100: Decimal;
        KTC500: Decimal;
        Foodpanda: Decimal;
        PGS1000: Decimal;
        HDPAYIN: Decimal;
        LineManCredit: Decimal;
        Lazada: Decimal;
        Claim: Decimal;
        HungryHub: Decimal;
        EVoucher600: Decimal;
        PGSCRM1000: Decimal;
        PGSCRM500: Decimal;
        EVoucherAIA150: Decimal;
        Customer: Integer;
        VARDate: Text;
        x: Integer;
    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        SellingPrice := 0;
        Discount := 0;
        TotalAmount := 0;
        GrandTotal := 0;
        AmountBeforeVAT := 0;
        SaleVATAmount := 0;
        Cash := 0;
        SC := 0;
        CreditCard := 0;
        Delivery := 0;
        GrabCredit := 0;
        LineMan := 0;
        HDCash := 0;
        HDCredit := 0;
        Robinhood := 0;
        SCBQR := 0;
        SPFCredit := 0;
        PaymentAmount := 0;
        DifferenceAmount := 0;
        AveragePerBill := 0;
        AveragePerCapita := 0;
        Customer := 0;
        KTC100 := 0;
        KTC500 := 0;
        Foodpanda := 0;
        PGS1000 := 0;
        HDPAYIN := 0;
        LineManCredit := 0;
        Lazada := 0;
        Claim := 0;
        HungryHub := 0;
        EVoucher600 := 0;
        PGSCRM1000 := 0;
        PGSCRM500 := 0;
        EVoucherAIA150 := 0;
        x := 0;
        Clear(VARDate);
        SumSalebyDay.Reset();
        if SumSalebyDay.FindLast() then
            EntryNo := SumSalebyDay."Entry No.";
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRowNo := TempExcelBuffer."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            SumSalebyDay.Init();
            SumSalebyDay."Entry No." := EntryNo;
            Evaluate(SumSalebyDay."Date", GetValueAtCell(RowNo, 1));
            Evaluate(SumSalebyDay."Bill No.", GetValueAtCell(RowNo, 2));

            if GetValueAtCell(RowNo, 3) = '' then begin
                Customer := 0;
                Evaluate(SumSalebyDay.Customer, format(Customer));
            end else begin
                Evaluate(SumSalebyDay.Customer, GetValueAtCell(RowNo, 3));
            end;

            if (GetValueAtCell(RowNo, 4) = '') or (GetValueAtCell(RowNo, 4) = '-') then begin
                SellingPrice := 0;
                Evaluate(SumSalebyDay."Selling Price", format(SellingPrice));
            end else begin
                Evaluate(SumSalebyDay."Selling Price", GetValueAtCell(RowNo, 4));
            end;

            if (GetValueAtCell(RowNo, 5) = '') or (GetValueAtCell(RowNo, 5) = '-') then begin
                Discount := 0;
                Evaluate(SumSalebyDay.Discount, format(Discount));
            end else begin
                Evaluate(SumSalebyDay.Discount, GetValueAtCell(RowNo, 5));
            end;

            if (GetValueAtCell(RowNo, 6) = '') or (GetValueAtCell(RowNo, 6) = '-') then begin
                TotalAmount := 0;
                Evaluate(SumSalebyDay."Total Amount", format(TotalAmount));
            end else begin
                Evaluate(SumSalebyDay."Total Amount", GetValueAtCell(RowNo, 6));
            end;

            if (GetValueAtCell(RowNo, 7) = '') or (GetValueAtCell(RowNo, 7) = '-') then begin
                SC := 0;
                Evaluate(SumSalebyDay.SC, format(SC));
            end else begin
                Evaluate(SumSalebyDay.SC, GetValueAtCell(RowNo, 7));
            end;

            if (GetValueAtCell(RowNo, 8) = '') or (GetValueAtCell(RowNo, 8) = '-') then begin
                GrandTotal := 0;
                Evaluate(SumSalebyDay."Grand Total", format(GrandTotal));
            end else begin
                Evaluate(SumSalebyDay."Grand Total", GetValueAtCell(RowNo, 8));
            end;

            if (GetValueAtCell(RowNo, 9) = '') or (GetValueAtCell(RowNo, 9) = '-') then begin
                AmountBeforeVAT := 0;
                Evaluate(SumSalebyDay."Amount Before VAT", format(AmountBeforeVAT));
            end else begin
                Evaluate(SumSalebyDay."Amount Before VAT", GetValueAtCell(RowNo, 9));
            end;

            if (GetValueAtCell(RowNo, 10) = '') or (GetValueAtCell(RowNo, 10) = '-') then begin
                SaleVATAmount := 0;
                Evaluate(SumSalebyDay."Sale VAT Amount", format(SaleVATAmount));
            end else begin
                Evaluate(SumSalebyDay."Sale VAT Amount", GetValueAtCell(RowNo, 10));
            end;

            if (GetValueAtCell(RowNo, 11) = '') or (GetValueAtCell(RowNo, 11) = '-') then begin
                Cash := 0;
                Evaluate(SumSalebyDay.Cash, format(Cash));
            end else begin
                Evaluate(SumSalebyDay.Cash, GetValueAtCell(RowNo, 11));
            end;

            if (GetValueAtCell(RowNo, 12) = '') or (GetValueAtCell(RowNo, 12) = '-') then begin
                CreditCard := 0;
                Evaluate(SumSalebyDay."Credit Card", format(CreditCard));
            end else begin
                Evaluate(SumSalebyDay."Credit Card", GetValueAtCell(RowNo, 12));
            end;

            if (GetValueAtCell(RowNo, 13) = '') or (GetValueAtCell(RowNo, 13) = '-') then begin
                KTC100 := 0;
                Evaluate(SumSalebyDay.KTC100, format(KTC100));
            end else begin
                Evaluate(SumSalebyDay.KTC100, GetValueAtCell(RowNo, 13));
            end;

            if (GetValueAtCell(RowNo, 14) = '') or (GetValueAtCell(RowNo, 14) = '-') then begin
                KTC500 := 0;
                Evaluate(SumSalebyDay.KTC500, format(KTC500));
            end else begin
                Evaluate(SumSalebyDay.KTC500, GetValueAtCell(RowNo, 14));
            end;

            if (GetValueAtCell(RowNo, 15) = '') or (GetValueAtCell(RowNo, 15) = '-') then begin
                FoodPanda := 0;
                Evaluate(SumSalebyDay."Food Panda", format(FoodPanda));
            end else begin
                Evaluate(SumSalebyDay."Food Panda", GetValueAtCell(RowNo, 15));
            end;

            if (GetValueAtCell(RowNo, 16) = '') or (GetValueAtCell(RowNo, 16) = '-') then begin
                Delivery := 0;
                Evaluate(SumSalebyDay.Delivery, format(Delivery));
            end else begin
                Evaluate(SumSalebyDay.Delivery, GetValueAtCell(RowNo, 16));
            end;

            if (GetValueAtCell(RowNo, 17) = '') or (GetValueAtCell(RowNo, 17) = '-') then begin
                PGS1000 := 0;
                Evaluate(SumSalebyDay.PGS1000, format(PGS1000));
            end else begin
                Evaluate(SumSalebyDay.PGS1000, GetValueAtCell(RowNo, 17));
            end;

            if (GetValueAtCell(RowNo, 18) = '') or (GetValueAtCell(RowNo, 18) = '-') then begin
                GrabCredit := 0;
                Evaluate(SumSalebyDay."Grab Credit", format(GrabCredit));
            end else begin
                Evaluate(SumSalebyDay."Grab Credit", GetValueAtCell(RowNo, 18));
            end;

            if (GetValueAtCell(RowNo, 19) = '') or (GetValueAtCell(RowNo, 19) = '-') then begin
                LineManCredit := 0;
                Evaluate(SumSalebyDay."Line Man (Credit)", format(LineManCredit));
            end else begin
                Evaluate(SumSalebyDay."Line Man (Credit)", GetValueAtCell(RowNo, 19));
            end;

            if (GetValueAtCell(RowNo, 20) = '') or (GetValueAtCell(RowNo, 20) = '-') then begin
                HDCash := 0;
                Evaluate(SumSalebyDay."HD (Cash)", format(HDCash));
            end else begin
                Evaluate(SumSalebyDay."HD (Cash)", GetValueAtCell(RowNo, 20));
            end;

            if (GetValueAtCell(RowNo, 21) = '') or (GetValueAtCell(RowNo, 21) = '-') then begin
                HDCredit := 0;
                Evaluate(SumSalebyDay."HD (Credit)", format(HDCredit));
            end else begin
                Evaluate(SumSalebyDay."HD (Credit)", GetValueAtCell(RowNo, 21));
            end;

            if (GetValueAtCell(RowNo, 22) = '') or (GetValueAtCell(RowNo, 22) = '-') then begin
                HDPAYIN := 0;
                Evaluate(SumSalebyDay."HD PAY IN", format(HDPAYIN));
            end else begin
                Evaluate(SumSalebyDay."HD PAY IN", GetValueAtCell(RowNo, 22));
            end;

            if (GetValueAtCell(RowNo, 23) = '') or (GetValueAtCell(RowNo, 23) = '-') then begin
                Lazada := 0;
                Evaluate(SumSalebyDay.Lazada, format(Lazada));
            end else begin
                Evaluate(SumSalebyDay.Lazada, GetValueAtCell(RowNo, 23));
            end;

            if (GetValueAtCell(RowNo, 24) = '') or (GetValueAtCell(RowNo, 24) = '-') then begin
                robinhood := 0;
                Evaluate(SumSalebyDay.robinhood, format(robinhood));
            end else begin
                Evaluate(SumSalebyDay.robinhood, GetValueAtCell(RowNo, 24));
            end;

            if (GetValueAtCell(RowNo, 25) = '') or (GetValueAtCell(RowNo, 25) = '-') then begin
                SCBQR := 0;
                Evaluate(SumSalebyDay."SCB QR", format(SCBQR));
            end else begin
                Evaluate(SumSalebyDay."SCB QR", GetValueAtCell(RowNo, 25));
            end;

            if (GetValueAtCell(RowNo, 26) = '') or (GetValueAtCell(RowNo, 26) = '-') then begin
                Claim := 0;
                Evaluate(SumSalebyDay.Claim, format(Claim));
            end else begin
                Evaluate(SumSalebyDay.Claim, GetValueAtCell(RowNo, 26));
            end;

            if (GetValueAtCell(RowNo, 27) = '') or (GetValueAtCell(RowNo, 27) = '-') then begin
                SPFCredit := 0;
                Evaluate(SumSalebyDay."SPF Credit", format(SPFCredit));
            end else begin
                Evaluate(SumSalebyDay."SPF Credit", GetValueAtCell(RowNo, 27));
            end;

            if (GetValueAtCell(RowNo, 28) = '') or (GetValueAtCell(RowNo, 28) = '-') then begin
                HungryHub := 0;
                Evaluate(SumSalebyDay."Hungry Hub", format(HungryHub));
            end else begin
                Evaluate(SumSalebyDay."Hungry Hub", GetValueAtCell(RowNo, 28));
            end;

            if (GetValueAtCell(RowNo, 29) = '') or (GetValueAtCell(RowNo, 29) = '-') then begin
                EVoucher600 := 0;
                Evaluate(SumSalebyDay."E-Voucher 600", format(EVoucher600));
            end else begin
                Evaluate(SumSalebyDay."E-Voucher 600", GetValueAtCell(RowNo, 29));
            end;

            if (GetValueAtCell(RowNo, 30) = '') or (GetValueAtCell(RowNo, 30) = '-') then begin
                PGSCRM1000 := 0;
                Evaluate(SumSalebyDay."PGS(CRM) 1000", format(PGSCRM1000));
            end else begin
                Evaluate(SumSalebyDay."PGS(CRM) 1000", GetValueAtCell(RowNo, 30));
            end;

            if (GetValueAtCell(RowNo, 31) = '') or (GetValueAtCell(RowNo, 31) = '-') then begin
                PGSCRM500 := 0;
                Evaluate(SumSalebyDay."PGS(CRM) 500", format(PGSCRM500));
            end else begin
                Evaluate(SumSalebyDay."PGS(CRM) 500", GetValueAtCell(RowNo, 31));
            end;

            if (GetValueAtCell(RowNo, 32) = '') or (GetValueAtCell(RowNo, 32) = '-') then begin
                EVoucherAIA150 := 0;
                Evaluate(SumSalebyDay."E-Voucher AIA 150", format(EVoucherAIA150));
            end else begin
                Evaluate(SumSalebyDay."E-Voucher AIA 150", GetValueAtCell(RowNo, 32));
            end;

            if (GetValueAtCell(RowNo, 33) = '') or (GetValueAtCell(RowNo, 33) = '-') then begin
                PaymentAmount := 0;
                Evaluate(SumSalebyDay."Payment Amount", format(PaymentAmount));
            end else begin
                Evaluate(SumSalebyDay."Payment Amount", GetValueAtCell(RowNo, 33));
            end;

            if (GetValueAtCell(RowNo, 34) = '') or (GetValueAtCell(RowNo, 34) = '-') then begin
                DifferenceAmount := 0;
                Evaluate(SumSalebyDay."Difference Amount", format(DifferenceAmount));
            end else begin
                Evaluate(SumSalebyDay."Difference Amount", GetValueAtCell(RowNo, 34));
            end;

            if (GetValueAtCell(RowNo, 35) = '') or (GetValueAtCell(RowNo, 35) = '-') then begin
                AveragePerBill := 0;
                Evaluate(SumSalebyDay."Average Per Bill", format(AveragePerBill));
            end else begin
                Evaluate(SumSalebyDay."Average Per Bill", GetValueAtCell(RowNo, 35));
            end;

            if (GetValueAtCell(RowNo, 36) = '') or (GetValueAtCell(RowNo, 36) = '-') then begin
                AveragePerCapita := 0;
                Evaluate(SumSalebyDay."Average Per Capita", format(AveragePerCapita));
            end else begin
                Evaluate(SumSalebyDay."Average Per Capita", GetValueAtCell(RowNo, 36));
            end;
            SumSalebyDay."Sheet Name" := SheetName;
            SumSalebyDay."File Name" := FileName;
            SumSalebyDay."Imported Date" := Today;
            SumSalebyDay."Imported Time" := Time;
            SumSalebyDay.Insert();
        end;
        Message(ExcelImportSucess);
    end;

    procedure ImportSaleSumarybyinvoice()
    var
        SaleSumarybyInv: Record "Sale Sumary by invoice";
        RowNo: Integer;
        ColNo: Integer;
        EntryNo: Integer;
        MaxRowNo: Integer;
        SellingPrice: Decimal;
        Discount: Decimal;
        TotalAmount: Decimal;
        SC: Decimal;
        GrandTotal: Decimal;
        AmountBeforeVAT: Decimal;
        SaleVATAmount: Decimal;
        Cash: Decimal;
        CreditCard: Decimal;
        Delivery: Decimal;
        GrabCredit: Decimal;
        LineMan: Decimal;
        HDCash: Decimal;
        HDCredit: Decimal;
        Robinhood: Decimal;
        SCBQR: Decimal;
        SPFCredit: Decimal;
        PaymentAmount: Decimal;
        DifferenceAmount: Decimal;
        AveragePerBill: Decimal;
        AveragePerCapita: Decimal;
        LineManCredit: Decimal;
        Food: Decimal;
        Desert: Decimal;
        Beverage: Decimal;
        Other: Decimal;
        Promotion: Decimal;
        FoodBox: Decimal;
        SumAmount: Decimal;
        Visa: Decimal;
        Master: Decimal;
        AmountIncVAT: Decimal;
        VATAmount: Decimal;
        NoofBill: Integer;
        Customer: Integer;
        VARDate: Text;
        x: Integer;
        Text001: Label 'Bill No.::%1 is Duplicate';
    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        SellingPrice := 0;
        Discount := 0;
        TotalAmount := 0;
        GrandTotal := 0;
        AmountBeforeVAT := 0;
        SaleVATAmount := 0;
        Cash := 0;
        SC := 0;
        CreditCard := 0;
        Delivery := 0;
        GrabCredit := 0;
        LineMan := 0;
        HDCash := 0;
        HDCredit := 0;
        Robinhood := 0;
        SCBQR := 0;
        SPFCredit := 0;
        PaymentAmount := 0;
        DifferenceAmount := 0;
        AveragePerBill := 0;
        AveragePerCapita := 0;
        Customer := 0;
        LineManCredit := 0;
        NoofBill := 0;
        Food := 0;
        Desert := 0;
        Beverage := 0;
        Other := 0;
        Promotion := 0;
        FoodBox := 0;
        SumAmount := 0;
        Visa := 0;
        Master := 0;
        AmountIncVAT := 0;
        VATAmount := 0;
        x := 0;
        Clear(VARDate);
        SaleSumarybyInv.Reset();
        if SaleSumarybyInv.FindLast() then
            EntryNo := SaleSumarybyInv."Entry No.";
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRowNo := TempExcelBuffer."Row No.";
        end;
        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            SaleSumarybyInv.Init();
            SaleSumarybyInv."Entry No." := EntryNo;
            if SaleSumarybyinvoiceCheckduplicate(GetValueAtCell(RowNo, 1)) = true then
                Error(Text001, GetValueAtCell(RowNo, 1));
            Evaluate(SaleSumarybyInv."Bill No.", GetValueAtCell(RowNo, 1));

            if (GetValueAtCell(RowNo, 2) = '') or (GetValueAtCell(RowNo, 2) = '-') then begin
                NoofBill := 0;
                Evaluate(SaleSumarybyInv."No. of Bill", format(NoofBill));
            end else begin
                Evaluate(SaleSumarybyInv."No. of Bill", GetValueAtCell(RowNo, 2));
            end;

            if (GetValueAtCell(RowNo, 3) = '') or (GetValueAtCell(RowNo, 3) = '-') then begin
                Customer := 0;
                Evaluate(SaleSumarybyInv.Customer, format(Customer));
            end else begin
                Evaluate(SaleSumarybyInv.Customer, GetValueAtCell(RowNo, 3));
            end;

            if (GetValueAtCell(RowNo, 4) = '') or (GetValueAtCell(RowNo, 4) = '-') then begin
                Food := 0;
                Evaluate(SaleSumarybyInv.Food, format(Food));
            end else begin
                Evaluate(SaleSumarybyInv.Food, GetValueAtCell(RowNo, 4));
            end;

            if (GetValueAtCell(RowNo, 5) = '') or (GetValueAtCell(RowNo, 5) = '-') then begin
                Desert := 0;
                Evaluate(SaleSumarybyInv.Desert, format(Desert));
            end else begin
                Evaluate(SaleSumarybyInv.Desert, GetValueAtCell(RowNo, 5));
            end;

            if (GetValueAtCell(RowNo, 6) = '') or (GetValueAtCell(RowNo, 6) = '-') then begin
                Beverage := 0;
                Evaluate(SaleSumarybyInv.Beverage, format(Beverage));
            end else begin
                Evaluate(SaleSumarybyInv.Beverage, GetValueAtCell(RowNo, 6));
            end;

            if (GetValueAtCell(RowNo, 7) = '') or (GetValueAtCell(RowNo, 7) = '-') then begin
                Other := 0;
                Evaluate(SaleSumarybyInv.Other, format(Other));
            end else begin
                Evaluate(SaleSumarybyInv.Other, GetValueAtCell(RowNo, 7));
            end;

            if (GetValueAtCell(RowNo, 8) = '') or (GetValueAtCell(RowNo, 8) = '-') then begin
                Promotion := 0;
                Evaluate(SaleSumarybyInv.Promotion, format(Promotion));
            end else begin
                Evaluate(SaleSumarybyInv.Promotion, GetValueAtCell(RowNo, 8));
            end;

            if (GetValueAtCell(RowNo, 9) = '') or (GetValueAtCell(RowNo, 9) = '-') then begin
                FoodBox := 0;
                Evaluate(SaleSumarybyInv."Food Box", format(FoodBox));
            end else begin
                Evaluate(SaleSumarybyInv."Food Box", GetValueAtCell(RowNo, 9));
            end;

            if (GetValueAtCell(RowNo, 10) = '') or (GetValueAtCell(RowNo, 10) = '-') then begin
                SumAmount := 0;
                Evaluate(SaleSumarybyInv.SumAmount, format(SumAmount));
            end else begin
                Evaluate(SaleSumarybyInv.SumAmount, GetValueAtCell(RowNo, 10));
            end;

            if (GetValueAtCell(RowNo, 11) = '') or (GetValueAtCell(RowNo, 11) = '-') then begin
                Discount := 0;
                Evaluate(SaleSumarybyInv.Discount, format(Discount));
            end else begin
                Evaluate(SaleSumarybyInv.Discount, GetValueAtCell(RowNo, 11));
            end;

            if (GetValueAtCell(RowNo, 12) = '') or (GetValueAtCell(RowNo, 12) = '-') then begin
                totalAmount := 0;
                Evaluate(SaleSumarybyInv."total Amount", format(totalAmount));
            end else begin
                Evaluate(SaleSumarybyInv."total Amount", GetValueAtCell(RowNo, 12));
            end;

            if (GetValueAtCell(RowNo, 13) = '') or (GetValueAtCell(RowNo, 13) = '-') then begin
                SC := 0;
                Evaluate(SaleSumarybyInv.SC, format(SC));
            end else begin
                Evaluate(SaleSumarybyInv.SC, GetValueAtCell(RowNo, 13));
            end;

            if (GetValueAtCell(RowNo, 14) = '') or (GetValueAtCell(RowNo, 14) = '-') then begin
                GrandTotal := 0;
                Evaluate(SaleSumarybyInv."Grand Total", format(GrandTotal));
            end else begin
                Evaluate(SaleSumarybyInv."Grand Total", GetValueAtCell(RowNo, 14));
            end;

            if (GetValueAtCell(RowNo, 15) = '') or (GetValueAtCell(RowNo, 15) = '-') then begin
                AmountIncVAT := 0;
                Evaluate(SaleSumarybyInv."Amount Inc. VAT", format(AmountIncVAT));
            end else begin
                Evaluate(SaleSumarybyInv."Amount Inc. VAT", GetValueAtCell(RowNo, 15));
            end;

            if (GetValueAtCell(RowNo, 16) = '') or (GetValueAtCell(RowNo, 16) = '-') then begin
                VATAmount := 0;
                Evaluate(SaleSumarybyInv."VAT Amount", format(VATAmount));
            end else begin
                Evaluate(SaleSumarybyInv."VAT Amount", GetValueAtCell(RowNo, 16));
            end;

            if (GetValueAtCell(RowNo, 17) = '') or (GetValueAtCell(RowNo, 17) = '-') then begin
                AveragePerCapita := 0;
                Evaluate(SaleSumarybyInv."Average Per Capita", format(AveragePerCapita));
            end else begin
                Evaluate(SaleSumarybyInv."Average Per Capita", GetValueAtCell(RowNo, 17));
            end;

            if (GetValueAtCell(RowNo, 18) = '') or (GetValueAtCell(RowNo, 18) = '-') then begin
                AveragePerBill := 0;
                Evaluate(SaleSumarybyInv."Average Per Bill", format(AveragePerBill));
            end else begin
                Evaluate(SaleSumarybyInv."Average Per Bill", GetValueAtCell(RowNo, 18));
            end;

            if (GetValueAtCell(RowNo, 19) = '') or (GetValueAtCell(RowNo, 19) = '-') then begin
                Cash := 0;
                Evaluate(SaleSumarybyInv.Cash, format(Cash));
            end else begin
                Evaluate(SaleSumarybyInv.Cash, GetValueAtCell(RowNo, 19));
            end;

            if (GetValueAtCell(RowNo, 20) = '') or (GetValueAtCell(RowNo, 20) = '-') then begin
                CreditCard := 0;
                Evaluate(SaleSumarybyInv."Credit Card", format(CreditCard));
            end else begin
                Evaluate(SaleSumarybyInv."Credit Card", GetValueAtCell(RowNo, 20));
            end;

            if (GetValueAtCell(RowNo, 21) = '') or (GetValueAtCell(RowNo, 21) = '-') then begin
                Visa := 0;
                Evaluate(SaleSumarybyInv.Visa, format(Visa));
            end else begin
                Evaluate(SaleSumarybyInv.Visa, GetValueAtCell(RowNo, 21));
            end;

            if (GetValueAtCell(RowNo, 22) = '') or (GetValueAtCell(RowNo, 22) = '-') then begin
                Master := 0;
                Evaluate(SaleSumarybyInv.Master, format(Master));
            end else begin
                Evaluate(SaleSumarybyInv.Master, GetValueAtCell(RowNo, 22));
            end;

            if (GetValueAtCell(RowNo, 23) = '') or (GetValueAtCell(RowNo, 23) = '-') then begin
                Delivery := 0;
                Evaluate(SaleSumarybyInv.Delivery, format(Delivery));
            end else begin
                Evaluate(SaleSumarybyInv.Delivery, GetValueAtCell(RowNo, 23));
            end;

            if (GetValueAtCell(RowNo, 24) = '') or (GetValueAtCell(RowNo, 24) = '-') then begin
                GrabCredit := 0;
                Evaluate(SaleSumarybyInv."Grab Credit", format(GrabCredit));
            end else begin
                Evaluate(SaleSumarybyInv."Grab Credit", GetValueAtCell(RowNo, 24));
            end;

            if (GetValueAtCell(RowNo, 25) = '') or (GetValueAtCell(RowNo, 25) = '-') then begin
                LineManCredit := 0;
                Evaluate(SaleSumarybyInv."Line Man (Credit)", format(LineManCredit));
            end else begin
                Evaluate(SaleSumarybyInv."Line Man (Credit)", GetValueAtCell(RowNo, 25));
            end;

            if (GetValueAtCell(RowNo, 26) = '') or (GetValueAtCell(RowNo, 26) = '-') then begin
                HDCash := 0;
                Evaluate(SaleSumarybyInv."HD (Cash)", format(HDCash));
            end else begin
                Evaluate(SaleSumarybyInv."HD (Cash)", GetValueAtCell(RowNo, 26));
            end;

            if (GetValueAtCell(RowNo, 27) = '') or (GetValueAtCell(RowNo, 27) = '-') then begin
                HDCredit := 0;
                Evaluate(SaleSumarybyInv."HD (Credit)", format(HDCredit));
            end else begin
                Evaluate(SaleSumarybyInv."HD (Credit)", GetValueAtCell(RowNo, 27));
            end;

            if (GetValueAtCell(RowNo, 28) = '') or (GetValueAtCell(RowNo, 28) = '-') then begin
                Robinhood := 0;
                Evaluate(SaleSumarybyInv.Robinhood, format(Robinhood));
            end else begin
                Evaluate(SaleSumarybyInv.Robinhood, GetValueAtCell(RowNo, 28));
            end;

            if (GetValueAtCell(RowNo, 29) = '') or (GetValueAtCell(RowNo, 29) = '-') then begin
                SCBQR := 0;
                Evaluate(SaleSumarybyInv."SCB QR", format(SCBQR));
            end else begin
                Evaluate(SaleSumarybyInv."SCB QR", GetValueAtCell(RowNo, 29));
            end;

            if (GetValueAtCell(RowNo, 30) = '') or (GetValueAtCell(RowNo, 30) = '-') then begin
                SPFCredit := 0;
                Evaluate(SaleSumarybyInv."SPF Credit", format(SPFCredit));
            end else begin
                Evaluate(SaleSumarybyInv."SPF Credit", GetValueAtCell(RowNo, 30));
            end;

            if (GetValueAtCell(RowNo, 31) = '') or (GetValueAtCell(RowNo, 31) = '-') then begin
                PaymentAmount := 0;
                Evaluate(SaleSumarybyInv."Payment Amount", format(PaymentAmount));
            end else begin
                Evaluate(SaleSumarybyInv."Payment Amount", GetValueAtCell(RowNo, 31));
            end;

            if (GetValueAtCell(RowNo, 32) = '') or (GetValueAtCell(RowNo, 32) = '-') then begin
                DifferenceAmount := 0;
                Evaluate(SaleSumarybyInv."Difference Amount", format(DifferenceAmount));
            end else begin
                Evaluate(SaleSumarybyInv."Difference Amount", GetValueAtCell(RowNo, 32));
            end;
            SaleSumarybyInv."Sheet Name" := SheetName;
            SaleSumarybyInv."File Name" := FileName;
            SaleSumarybyInv."Imported Date" := Today;
            SaleSumarybyInv."Imported Time" := Time;
            SaleSumarybyInv.Insert();
        end;
        Message(ExcelImportSucess);
    end;

    procedure ImportSaleVATEntriesbyInvoice()
    var
        SaleVATEntriesbyInv: Record "Sale VAT Entries by Invoice";
        RowNo: Integer;
        ColNo: Integer;
        EntryNo: Integer;
        MaxRowNo: Integer;
        Number: Integer;
        Amount: Decimal;
        VATAmount: Decimal;
        TotalAmount: Decimal;
    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        Number := 0;
        Amount := 0;
        VATAmount := 0;
        TotalAmount := 0;
        SaleVATEntriesbyInv.Reset();
        if SaleVATEntriesbyInv.FindLast() then
            EntryNo := SaleVATEntriesbyInv."Entry No.";
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRowNo := TempExcelBuffer."Row No.";
        end;
        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            SaleVATEntriesbyInv.Init();
            SaleVATEntriesbyInv."Entry No." := EntryNo;
            if (GetValueAtCell(RowNo, 1) = '') or (GetValueAtCell(RowNo, 1) = '-') then begin
                Number := 0;
                Evaluate(SaleVATEntriesbyInv.Number, format(Number));
            end else begin
                Evaluate(SaleVATEntriesbyInv.Number, GetValueAtCell(RowNo, 1));
            end;
            Evaluate(SaleVATEntriesbyInv."Date", GetValueAtCell(RowNo, 2));
            Evaluate(SaleVATEntriesbyInv."Tax Invoice No.", GetValueAtCell(RowNo, 3));
            Evaluate(SaleVATEntriesbyInv."Customer Name", GetValueAtCell(RowNo, 4));
            Evaluate(SaleVATEntriesbyInv."VAT Register No.", GetValueAtCell(RowNo, 5));
            Evaluate(SaleVATEntriesbyInv."Head Office", GetValueAtCell(RowNo, 6));
            Evaluate(SaleVATEntriesbyInv.Branch, GetValueAtCell(RowNo, 7));
            Evaluate(SaleVATEntriesbyInv.Description, GetValueAtCell(RowNo, 8));

            if (GetValueAtCell(RowNo, 9) = '') or (GetValueAtCell(RowNo, 9) = '-') then begin
                Amount := 0;
                Evaluate(SaleVATEntriesbyInv.Amount, format(Amount));
            end else begin
                Evaluate(SaleVATEntriesbyInv.Amount, GetValueAtCell(RowNo, 9));
            end;

            if (GetValueAtCell(RowNo, 10) = '') or (GetValueAtCell(RowNo, 10) = '-') then begin
                VATAmount := 0;
                Evaluate(SaleVATEntriesbyInv."VAT Amount", format(VATAmount));
            end else begin
                Evaluate(SaleVATEntriesbyInv."VAT Amount", GetValueAtCell(RowNo, 10));
            end;

            if (GetValueAtCell(RowNo, 11) = '') or (GetValueAtCell(RowNo, 11) = '-') then begin
                TotalAmount := 0;
                Evaluate(SaleVATEntriesbyInv."Total Amount", format(TotalAmount));
            end else begin
                Evaluate(SaleVATEntriesbyInv."Total Amount", GetValueAtCell(RowNo, 11));
            end;
            Evaluate(SaleVATEntriesbyInv.Remark, GetValueAtCell(RowNo, 12));
            SaleVATEntriesbyInv."Sheet Name" := SheetName;
            SaleVATEntriesbyInv."File Name" := FileName;
            SaleVATEntriesbyInv."Imported Date" := Today;
            SaleVATEntriesbyInv."Imported Time" := Time;
            SaleVATEntriesbyInv.Insert();
        end;
        Message(ExcelImportSucess);
    end;

    procedure ImportSaleVATEntriesbyDays()
    var
        SaleVATEntriesbyDays: Record "Sale VAT Entries by Days";
        RowNo: Integer;
        ColNo: Integer;
        EntryNo: Integer;
        MaxRowNo: Integer;
        Number: Integer;
        Amount: Decimal;
        VATAmount: Decimal;
        TotalAmount: Decimal;
    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        EntryNo := 0;
        Number := 0;
        Amount := 0;
        VATAmount := 0;
        TotalAmount := 0;
        SaleVATEntriesbyDays.Reset();
        if SaleVATEntriesbyDays.FindLast() then
            EntryNo := SaleVATEntriesbyDays."Entry No.";
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRowNo := TempExcelBuffer."Row No.";
        end;
        for RowNo := 2 to MaxRowNo do begin
            EntryNo := EntryNo + 1;
            SaleVATEntriesbyDays.Init();
            SaleVATEntriesbyDays."Entry No." := EntryNo;
            if (GetValueAtCell(RowNo, 1) = '') or (GetValueAtCell(RowNo, 1) = '-') then begin
                Number := 0;
                Evaluate(SaleVATEntriesbyDays.Number, format(Number));
            end else begin
                Evaluate(SaleVATEntriesbyDays.Number, GetValueAtCell(RowNo, 1));
            end;

            Evaluate(SaleVATEntriesbyDays."Date", GetValueAtCell(RowNo, 2));
            Evaluate(SaleVATEntriesbyDays."Tax Invoice No.", GetValueAtCell(RowNo, 3));
            Evaluate(SaleVATEntriesbyDays."Cash Register Code", GetValueAtCell(RowNo, 4));
            Evaluate(SaleVATEntriesbyDays.Description, GetValueAtCell(RowNo, 5));
            if (GetValueAtCell(RowNo, 6) = '') or (GetValueAtCell(RowNo, 6) = '-') then begin
                Amount := 0;
                Evaluate(SaleVATEntriesbyDays.Amount, format(Amount));
            end else begin
                Evaluate(SaleVATEntriesbyDays.Amount, GetValueAtCell(RowNo, 6));
            end;

            if (GetValueAtCell(RowNo, 7) = '') or (GetValueAtCell(RowNo, 7) = '-') then begin
                VATAmount := 0;
                Evaluate(SaleVATEntriesbyDays."VAT Amount", format(VATAmount));
            end else begin
                Evaluate(SaleVATEntriesbyDays."VAT Amount", GetValueAtCell(RowNo, 7));
            end;

            if (GetValueAtCell(RowNo, 8) = '') or (GetValueAtCell(RowNo, 8) = '-') then begin
                TotalAmount := 0;
                Evaluate(SaleVATEntriesbyDays."Total Amount", format(TotalAmount));
            end else begin
                Evaluate(SaleVATEntriesbyDays."Total Amount", GetValueAtCell(RowNo, 8));
            end;
            Evaluate(SaleVATEntriesbyDays.Remark, GetValueAtCell(RowNo, 9));
            Evaluate(SaleVATEntriesbyDays."Canceled Receipt No.", GetValueAtCell(RowNo, 10));
            SaleVATEntriesbyDays."Sheet Name" := SheetName;
            SaleVATEntriesbyDays."File Name" := FileName;
            SaleVATEntriesbyDays."Imported Date" := Today;
            SaleVATEntriesbyDays."Imported Time" := Time;
            SaleVATEntriesbyDays.Insert();
        end;
        Message(ExcelImportSucess);
    end;

    var
        FileName: Text[100];
        SheetName: Text[100];
        TempExcelBuffer: Record "Excel Buffer" temporary;
        UploadExcelMsg: Label 'Please Choose the Excel file.';
        NoFileFoundMsg: Label 'No Excel file found!';
        ExcelImportSucess: Label 'Excel is successfully imported.';
}