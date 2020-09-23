/*==============================================================================

							  Virtual RT2
						   September 23, 2020
							 
					STATA MARKDOWN MASTER DO FILE
							 
==============================================================================*/

/*******************************************************************************
	PART 0: Select sections to run
*******************************************************************************/

	local packages		1
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

		* Tell Stata where to find the relevant programs :
		* On Mac/Linux, go to terminal and type "which pdflatex" and "which pandoc"
		* On Windows, go to the command prompt and type "where pdflatex" and "where pandoc"
		* Paste the respective results on the lines below
		whereis pdflatex 			"ADD/FILE/PATH/HERE"
		whereis pandoc 				"ADD/FILE/PATH/HERE"
		
		* Workshop folder
		global	RT2					"ADD/FILE/PATH/HERE"
	}
	
/*******************************************************************************
	PART 3: Create document
*******************************************************************************/

	if `document' {
	
		* Copy the Stata style to the same folder as the markdown file to compile in PDF
		//copy https://www.stata-journal.com/production/sjlatex/stata.sty 	stata.sty
		
		cd "${RT2}"
		markstat using "Stata markdown template"
	
	}
	
*============================== THE END =======================================*
