//%attributes = {}
  // HDI_ex1_init ( ) -> return
  //
  // $0 : (object) (return) dataset
  //
  // Init dataset for HDI_ex1

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 04.11.19, 15:41:43
	  // ----------------------------------------------------
	  // Method: HDI_ex1_init
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_OBJECT:C1216($0;$o)
$o:=New object:C1471()

  // companies data
C_COLLECTION:C1488($companies)
$companies:=New collection:C1472()
C_OBJECT:C1216($company)
$company:=New object:C1471()
$company.name:="AJAR SA"
$company.firstname:="Gabriel"
$company.lastname:="Inzirillo"
$company.phone:="✆ +41 32 546 8998"
$company.logo:="logos/Ajar.svg"
$companies.push($company)
$company:=New object:C1471()
$company.name:="4D SAS"
$company.firstname:="Laurent"
$company.lastname:="Ribardière"
$company.phone:="✆ +33 1 4587 5689"
$company.logo:="logos/4D.svg"
$companies.push($company)
$company:=New object:C1471()
$company.name:="Apple"
$company.firstname:="Steve"
$company.lastname:="Jobs"
$company.phone:="✆ +1 568 9523 1457"
$company.logo:="logos/apple.svg"
$companies.push($company)
$o.companies:=New collection:C1472()
$o.companies:=$companies


  // Offers-Orders data
C_COLLECTION:C1488($offers)
$offers:=New collection:C1472()
C_OBJECT:C1216($offer)
  // AJAR
$offer:=New object:C1471()
$offer.nameCompany:="AJAR SA"
$offer.ref:="001"
$offer.date:=!2019-10-24!
$offer.name:="4D pencyl"
$offer.qty:=2
$offer.unitPrice:=0.4
$offer.total:=$offer.qty*$offer.unitPrice
$offer.delivery_date:=!2019-10-30!
$offer.delivery_state:="Ready to Ship"
$offers.push($offer)
$offer:=New object:C1471()
$offer.nameCompany:="AJAR SA"
$offer.ref:="002"
$offer.date:=!2019-09-01!
$offer.name:="Calculator"
$offer.qty:=5
$offer.unitPrice:=19.5
$offer.total:=$offer.qty*$offer.unitPrice
$offer.delivery_date:=!2019-09-01!
$offer.delivery_state:="In Process"
$offers.push($offer)
  // 4D
$offer:=New object:C1471()
$offer.nameCompany:="4D SAS"
$offer.ref:="003"
$offer.date:=!2019-10-24!
$offer.name:="iPad"
$offer.qty:=2
$offer.unitPrice:=775.5
$offer.total:=$offer.qty*$offer.unitPrice
$offer.delivery_date:=!2019-10-25!
$offer.delivery_state:="In Transit"
$offers.push($offer)
$offer:=New object:C1471()
$offer.nameCompany:="4D SAS"
$offer.ref:="008"
$offer.date:=!2019-10-24!
$offer.name:="iPhone"
$offer.qty:=5
$offer.unitPrice:=985.3
$offer.total:=$offer.qty*$offer.unitPrice
$offer.delivery_date:=!2019-10-26!
$offer.delivery_state:="Delivered"
$offers.push($offer)
  // Apple
$offer:=New object:C1471()
$offer.nameCompany:="Apple"
$offer.ref:="015"
$offer.date:=!2019-09-22!
$offer.name:="4D Server"
$offer.qty:=200
$offer.unitPrice:=1300
$offer.total:=$offer.qty*$offer.unitPrice
$offer.delivery_date:=!2019-10-23!
$offer.delivery_state:="Ready to Ship"
$offers.push($offer)
$offer:=New object:C1471()
$offer.nameCompany:="Apple"
$offer.ref:="012"
$offer.date:=!2019-09-22!
$offer.name:="4D Dev Pro v18"
$offer.qty:=20
$offer.unitPrice:=1450
$offer.total:=$offer.qty*$offer.unitPrice
$offer.delivery_date:=!2019-09-25!
$offer.delivery_state:="In Process"
$offers.push($offer)
$o.offers:=New collection:C1472()
$o.offers:=$offers



$o.currentHDISection:="customers"  // default 

$0:=$o