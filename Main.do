/*==============================================================================

		  DIME Analytics Continuing Education - Stata Markdown
							Porto, PT
						  December 17, 2023
							 
					STATA MARKDOWN MASTER DO FILE
							 
Author: Luiza Cardoso de Andrade
Last modified: by Luis Eduardo San Martin on February 10 2021
							 
==============================================================================*/

/*******************************************************************************
	PART 0: Select sections to run
*******************************************************************************/

	local packages		0
	local paths			1
	local document		1

/*******************************************************************************
	PART 1: Install necessary packages
*******************************************************************************/

	if `packages' {
		
		* Install markstat to use Stata markdown
		ssc install markstat, replace

		* Install whereis to make markstat work
		ssc install whereis, replace
		
		* Install other commands we will use for this session
		ssc install estout, replace
		ssc install unique, replace
		
	}
	
/*******************************************************************************
	PART 2: Set folder paths
*******************************************************************************/

	if `paths' {

		* Tell Stata where to find the relevant programs	
		whereis pdflatex 			"C:\texlive\2023\bin\windows\pdflatex.exe"
									*example: "C:\Program Files\MiKTeX 2.9\miktex\bin\x64\pdflatex.exe"

		whereis pandoc 				"C:\Users\luizaandrade\AppData\Local\Pandoc\pandoc.exe"
									*example: "C:/WBG/pandoc-2.10.1/pandoc.exe"
				
		* Session folder
		* Paste here the location of this session's materials
		global	mdfolder	"C:\Users\luizaandrade\Documents\GitHub\stata-markdown"
							*example: "C:\Users\wb532468\OneDrive - WBG\Documents\stata-markdown-CE-session"
	}

/*******************************************************************************
	PART 3: Create document
*******************************************************************************/

	if `document' {
	
		* Copy the Stata style to the same folder as the markdown file to compile in PDF
		cd "${mdfolder}"
		//copy https://www.stata-journal.com/production/sjlatex/stata.sty 	stata.sty
		
		markstat using "${mdfolder}/stata-markdown-template", pdf
	
	}
	
*============================== THE END =======================================*
