{-------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: SynEditStrConst.pas, released 2000-04-07.
The Original Code is based on mwLocalStr.pas by Michael Hieke, part of the
mwEdit component suite.
All Rights Reserved.

Contributors to the SynEdit and mwEdit projects are listed in the
Contributors.txt file.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

$Id: SynEditStrConst.pas,v 1.12 2001/08/21 13:41:55 jjans Exp $

You may retrieve the latest version of this file at the SynEdit home page,
located at http://SynEdit.SourceForge.net

Known Issues:
-------------------------------------------------------------------------------}

unit SynEditStrConst;

{$I SynEdit.inc}

interface

// NOTE: this is design-time stuff, so no need to have it in stringtables
const
  SYNS_ComponentsPage           =  'SynEdit';
  SYNS_HighlightersPage         =  'SynEdit Highlighters';

{$IFDEF SYN_COMPILER_3_UP}
resourcestring
{$ELSE}
const
{$ENDIF}

  SYNS_Untitled                 =  'Untitled';

  // names for highlighter attributes
  SYNS_AttrAsm                  =  'Asm';
  SYNS_AttrAsmComment           =  'Asm comment';
  SYNS_AttrAsmKey               =  'Asm key';
  SYNS_AttrASP                  =  'Asp';
  SYNS_AttrAssembler            =  'Assembler';
  SYNS_AttrAttributeName        =  'Attribute Name';
  SYNS_AttrAttributeValue       =  'Attribute Value';
  SYNS_AttrBlock                =  'Block';
  SYNS_AttrBrackets             =  'Brackets';
  SYNS_AttrCDATASection         =  'CDATA Section';
  SYNS_AttrCharacter            =  'Character';
  SYNS_AttrClass                =  'Class';
  SYNS_AttrComment              =  'Comment';
  SYNS_AttrCondition            =  'Condition';
  SYNS_AttrDataType             =  'Data type';
  SYNS_AttrDefaultPackage       =  'Default packages';
  SYNS_AttrDir                  =  'Direction';
  SYNS_AttrDirective            =  'Directive';
  SYNS_AttrDOCTYPESection       =  'DOCTYPE Section';
  SYNS_AttrDocumentation        =  'Documentation';
  SYNS_AttrElementName          =  'Element Name';
  SYNS_AttrEmbedSQL             =  'Embedded SQL';
  SYNS_AttrEmbedText            =  'Embedded text';
  SYNS_AttrEntityReference      =  'Entity Reference';
  SYNS_AttrEscapeAmpersand      =  'Escape ampersand';
  SYNS_AttrEvent                =  'Event';
  SYNS_AttrException            =  'Exception';
  SYNS_AttrForm                 =  'Form';
  SYNS_AttrFunction             =  'Function';
  SYNS_AttrIcon                 =  'Icon reference';
  SYNS_AttrIdentifier           =  'Identifier';
  SYNS_AttrIllegalChar          =  'Illegal char';
  SYNS_AttrInclude              =  'Include';
  SYNS_AttrIndirect             =  'Indirect';
  SYNS_AttrInvalidSymbol        =  'Invalid symbol';
  SYNS_AttrInternalFunction     =  'Internal function';
  SYNS_AttrKey                  =  'Key';
  SYNS_AttrLabel                =  'Label';
  SYNS_AttrMacro                =  'Macro';
  SYNS_AttrMarker               =  'Marker';
  SYNS_AttrMessage              =  'Message';
  SYNS_AttrMiscellaneous        =  'Miscellaneous';
  SYNS_AttrNamespaceAttrName    =  'Namespace Attribute Name';
  SYNS_AttrNamespaceAttrValue   =  'Namespace Attribute Value';
  SYNS_AttrNonReservedKeyword   =  'Non-reserved keyword';
  SYNS_AttrNull                 =  'Null';
  SYNS_AttrNumber               =  'Number';
  SYNS_AttrOperator             =  'Operator';
  SYNS_AttrPLSQL                =  'Reserved word (PL/SQL)';
  SYNS_AttrPragma               =  'Pragma';
  SYNS_AttrPreprocessor         =  'Preprocessor';
  SYNS_AttrProcessingInstr      =  'Processing Instruction';
  SYNS_AttrQualifier            =  'Qualifier';
  SYNS_AttrRegister             =  'Register';
  SYNS_AttrReservedWord         =  'Reserved word';
  SYNS_AttrRpl                  =  'Rpl';
  SYNS_AttrRplKey               =  'Rpl key';
  SYNS_AttrRplComment           =  'Rpl comment';
  SYNS_AttrSASM                 =  'SASM';
  SYNS_AttrSASMComment          =  'SASM Comment';
  SYNS_AttrSASMKey              =  'SASM Key';
  SYNS_AttrSecondReservedWord   =  'Second reserved word';
  SYNS_AttrSection              =  'Section';
  SYNS_AttrSpace                =  'Space';
  SYNS_AttrSpecialVariable      =  'Special variable';
  SYNS_AttrSQLKey               =  'SQL keyword';  
  SYNS_AttrSQLPlus              =  'SQL*Plus command';
  SYNS_AttrString               =  'String';
  SYNS_AttrSymbol               =  'Symbol';
  SYNS_AttrSyntaxError          =  'SyntaxError';
  SYNS_AttrSystem               =  'System functions and variables';
  SYNS_AttrSystemValue          =  'System value';
  SYNS_AttrText                 =  'Text';
  SYNS_AttrUnknownWord          =  'Unknown word';
  SYNS_AttrUser                 =  'User functions and variables';
  SYNS_AttrUserFunction         =  'User functions';
  SYNS_AttrValue                =  'Value';
  SYNS_AttrVariable             =  'Variable';
  SYNS_AttrWhitespace           =  'Whitespace';

  // names of exporter output formats
  SYNS_ExporterFormatHTML       =  'HTML';
  SYNS_ExporterFormatRTF        =  'RTF';

  // TCustomSynEdit scroll hint window caption
  SYNS_ScrollInfoFmt            =  'Top Line: %d';
  // TSynEditPrintPreview page number
  SYNS_PreviewScrollInfoFmt     =  'Page: %d';

  // strings for property editors etc
  SYNS_EDuplicateShortcut       =  'Shortcut already exists';
  SYNS_ShortcutNone             =  '<none>';
  SYNS_DuplicateShortcutMsg     =  'The keystroke "%s" is already assigned ' +
                                   'to another editor command.';
  SYNS_DuplicateShortcutMsg2    =  'The keystroke "%s" is already assigned ' +
                                   'to another editor command.'#13#10'The ' +
                                   'shortcut for this item has not been changed.';

  // Filters used for open/save dialog
  SYNS_FilterPascal             =  'Pascal Files (*.pas,*.dpr,*.dpk,*.inc)|*.pas;*.dpr;*.dpk;*.inc';
  SYNS_FilterHP48               =  'HP48 Files (*.s,*.sou,*.a,*.hp)|*.s;*.sou;*.a;*.hp';
  SYNS_FilterCAClipper          =  'CA-Clipper Files (*.prg,*.ch,*.inc)|*.prg;*.ch;*.inc';
  SYNS_FilterCPM                =  'CPM reports (*.rdf,*.rif,*.rmf,*.rxf)|*.rdf;*.rif;*.rmf;*.rxf';
  SYNS_FilterCPP                =  'C++ Files (*.cpp,*.h,*.hpp)|*.cpp;*.h;*.hpp';
  SYNS_FilterJava               =  'Java Files (*.java)|*.java';
  SYNS_FilterPerl               =  'Perl Files (*.pl,*.pm,*.cgi)|*.pl;*.pm;*.cgi';
  SYNS_FilterAWK                =  'AWK Script (*.awk)|*.awk';
  SYNS_FilterHTML               =  'HTML Document (*.htm,*.html)|*.htm;*.html';
  SYNS_FilterVBScript           =  'VBScript Files (*.vbs)|*.vbs';
  SYNS_FilterGalaxy             =  'Galaxy Files (*.gtv,*.galrep,*.txt)|*.gtv;*.galrep;*.txt';
  SYNS_FilterPython             =  'Python Files (*.py)|*.py';
  SYNS_FilterSQL                =  'SQL Files (*.sql)|*.sql';
  SYNS_FilterHP                 =  'HP48 Files (*.s,*.sou,*.a,*.hp)|*.S;*.SOU;*.A;*.HP';
  SYNS_FilterTclTk              =  'Tcl/Tk Files (*.tcl)|*.tcl';
  SYNS_FilterRTF                =  'Rich Text Format (*.rtf)|*.rtf';
  SYNS_FilterBatch              =  'MS-DOS Batch Files (*.bat;*.cmd)|*.bat;*.cmd';
  SYNS_FilterDFM                =  'Delphi/C++ Builder Form Files (*.dfm;*.xfm)|*.dfm;*.xfm';
  SYNS_FilterX86Asm             =  'x86 Assembly Files (*.asm)|*.ASM';
  SYNS_FilterGembase            =  'GEMBASE Files (*.dml,*.gem)|*.DML;*.GEM';
  SYNS_FilterINI                =  'INI Files (*.ini)|*.ini';
  SYNS_FilterSML                =  'Standard ML Files (*.sml)|*.sml';
  SYNS_FilterVisualBASIC        =  'Visual Basic Files (*.bas)|*.bas';
  SYNS_FilterADSP21xx           =  'DSP Files (*.dsp,*.inc)|*.DSP;*.INC';
  SYNS_FilterPHP                =  'PHP Files (*.php,*.php3,*.phtml,*.inc)|*.php;*.php3;*.phtml;*.inc';
  SYNS_FilterCache              =  'Cache Files (*.mac,*.inc,*.int)|*.mac;*.inc;*.int';
  SYNS_FilterCSS                =  'Cascading Stylesheets (*.css)|*.css';
  SYNS_FilterJScript            =  'Javascript Files (*.js)|*.js';
  SYNS_FilterKIX                =  'Kix Scripts (*.kix)|*.kix';
  SYNS_FilterBaan               =  'Baan 4GL Files (*.cln)|*.cln';
  SYNS_FilterFoxpro             =  'Foxpro Files (*.prg)|*.prg';
  SYNS_FilterFortran            =  'Fortran Files (*.for)|*.for';
  SYNS_FilterAsm68HC11          =  '68HC11 Assembler Files (*.hc11,*.asm,*.asc)|*.HC11;*.ASM;*.ASC';
  SYNS_FilterProgress           =  'Progress Files (*.w,*.p,*.i)|*.w;*.p;*.i';
  SYNS_FilterInno               =  'Inno Setup Script Files (*.iss)|*.iss';
  SYNS_FilterModelica           =  'Modelica Files (*.mo)|*.mo';
  SYNS_FilterModula3            =  'Modula-3 Files (*.m3)|*.m3';
  SYNS_FilterSDD                =  'Semanta DD files (*.sdd)|*.sdd';
  SYNS_FilterXML                =  'XML Document (*.xml,*.xsd,*.xsl,*.xslt)|*.xml;*.xsd;*.xsl;*.xslt';
  SYNS_FilterGWS                =  'GW-TEL Script Files (*.gws)|*.gws';

  // Language names. Maybe somebody wants them translated / more detailed...
  SYNS_LangHP48                 =  'HP48';
  SYNS_LangCAClipper            =  'CA-Clipper';
  SYNS_LangCPM                  =  'COAS Product Manager reports';
  SYNS_LangCPP                  =  'C++';
  SYNS_LangJava                 =  'Java';
  SYNS_LangPerl                 =  'Perl';
  SYNS_LangBatch                =  'MS-DOS Batch Language';
  SYNS_LangDfm                  =  'Delphi/C++ Builder Form Definitions';
  SYNS_LangAWK                  =  'AWK Script';
  SYNS_LangHTML                 =  'HTML Document';
  SYNS_LangVBSScript            =  'MS VBScript';
  SYNS_LangGalaxy               =  'Galaxy';
  SYNS_LangGeneral              =  'General';
  SYNS_LangPascal               =  'ObjectPascal';
  SYNS_LangX86Asm               =  'x86 Assembly Language';
  SYNS_LangPython               =  'Python';
  SYNS_LangTclTk                =  'Tcl/Tk';
  SYNS_LangSQL                  =  'SQL';
  SYNS_LangGembase              =  'Gembase';
  SYNS_LangINI                  =  'INI Files';
  SYNS_LangSML                  =  'Standard ML';
  SYNS_LangVisualBASIC          =  'Visual Basic';
  SYNS_LangADSP21xx             =  'ADSP21xx';
  SYNS_LangPHP                  =  'PHP';
  SYNS_LangSybaseSQL            =  'Sybase SQL';
  SYNS_LangGeneralMulti         =  'General Multi-Highlighter';
  SYNS_LangCache                =  'Cache Object Script';
  SYNS_LangCSS                  =  'Cascading Stylesheets';
  SYNS_LangJScript              =  'Javascript';
  SYNS_LangKIX                  =  'KIX32';
  SYNS_LangBaan                 =  'Baan 4GL';
  SYNS_LangFoxpro               =  'Foxpro';
  SYNS_LangFortran              =  'Fortran';
  SYNS_Lang68HC11               =  '68HC11 Assembler';
  SYNS_LangProgress             =  'Progress';
  SYNS_LangInno                 =  'Inno Setup Scripts';
  SYNS_LangModelica             =  'Modelica';
  SYNS_LangModula3              =  'Modula 3';
  SYNS_LangSDD                  =  'Semanta data dictionary';
  SYNS_LangXML                  =  'XML Document';
  SYNS_LangGWS                  =  'GW-TEL Script';

implementation

end.

