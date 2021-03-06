// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Search.pas' rev: 4.00

#ifndef SearchHPP
#define SearchHPP

#pragma delphiheader begin
#pragma option push -w-
#include <Db.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <DBGrids.hpp>	// Pascal unit
#include <Grids.hpp>	// Pascal unit
#include <DBCtrls.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Search
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TSearchForm;
#pragma pack(push, 4)
class PASCALIMPLEMENTATION TSearchForm : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Stdctrls::TButton* Button1;
	Stdctrls::TLabel* Label1;
	Stdctrls::TLabel* Label2;
	Dbgrids::TDBGrid* DBGrid1;
	Stdctrls::TEdit* title_edit;
	Stdctrls::TButton* Button3;
	Stdctrls::TButton* Button2;
	Stdctrls::TEdit* author_edit;
	void __fastcall Button4Click(System::TObject* Sender);
	void __fastcall Button1Click(System::TObject* Sender);
	void __fastcall RadioButton1Click(System::TObject* Sender);
	void __fastcall RadioButton2Click(System::TObject* Sender);
	void __fastcall title_editChange(System::TObject* Sender);
	void __fastcall author_editChange(System::TObject* Sender);
	void __fastcall Button2Click(System::TObject* Sender);
	void __fastcall Button3Click(System::TObject* Sender);
	void __fastcall title_editEnter(System::TObject* Sender);
	void __fastcall author_editEnter(System::TObject* Sender);
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TSearchForm(Classes::TComponent* AOwner) : Forms::TForm(
		AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TSearchForm(Classes::TComponent* AOwner, int 
		Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TSearchForm(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TSearchForm(HWND ParentWindow) : Forms::TForm(ParentWindow
		) { }
	#pragma option pop
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TSearchForm* SearchForm;

}	/* namespace Search */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Search;
#endif
#pragma option pop	// -w-

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Search
