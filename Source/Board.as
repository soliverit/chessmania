class Board
{
	//Members
	Square[][] Squares;
	//Geometry 
	int Width				= 400;
	int Height				= 400;
	int X					= 80;
	int Y					= 80;
	// Colours
	vec4 BoardColour		= vec4(200, 1, 1, 1);
	vec4 SquareOddColour	= vec4(0.1803, 0.0274, 0.00784, .95);
	vec4 SquareEvenColour	= vec4(1, 0.9803, 0.9568, 0.9);
	vec4 BorderColour		= vec4(0.1803, 0.0274, 0.00784, .95);
	vec4 OutlineColour		= vec4(1, 0.9803, 0.9568, 0.9);
	vec4 LabelColour		= vec4(1, 0.9803, 0.9568, 1.0);
	string[] LetterLabels	= {"A", "B", "C", "D", "E", "F", "G", "H"};
	nvg::Font Font = nvg::LoadFont("DroidSans.ttf", true);
	Board()
	{
		for(uint rowID = 0; rowID < 8; rowID++)
		{
			Square[] row;
			for(uint columnID = 0; columnID < 8; columnID++)
			{
				row.InsertLast(Square());
			}
			Squares.InsertLast(row);
		}
	}
	/*
		"Geometry" (if you can call it that) helpers
	*/
	float OffsetX(float x){return x + X;}
	float OffsetY(float y){return y + Y;}
	float InverseOffsetY(float y){return OffsetX(Height) - y;}
	int SquareWidth(){return Width / 8;}
	void Render()
	{
		int squareWidth	= SquareWidth();
		int borderWidth	= squareWidth / 1.7;
		// Border
		nvg::BeginPath();
		nvg::RoundedRect(X - borderWidth , Y - borderWidth, OffsetX( Width + borderWidth), OffsetY(Height + borderWidth), 4.0);
		nvg::StrokeWidth(2.0);
		nvg::StrokeColor(OutlineColour);
		nvg::FillColor(BorderColour);

		nvg::Fill();
		nvg::Stroke();
		// Background
		nvg::BeginPath();
		nvg::MoveTo(vec2(X, Y));
		nvg::LineTo(vec2(OffsetX(Width),Y));
		nvg::LineTo(vec2(OffsetX(Width), OffsetY(Height)));
		nvg::LineTo(vec2(X, OffsetY(Height)));
		nvg::FillColor(BoardColour);
		nvg::Fill();
		nvg::ClosePath();
		// Squares
		bool isOddTile	= true;
		for(uint rowID = 0; rowID < 8; rowID++)
		{	
			int y	= OffsetY(squareWidth * rowID);

			for(uint cellID = 0; cellID < 8; cellID++)
			{
				// Position
				int x	= OffsetX(squareWidth * cellID);
				// Colour
				vec4 tileColour	= isOddTile ? SquareOddColour : SquareEvenColour;
				isOddTile	= ! isOddTile;
				// Draw
				nvg::BeginPath();
				nvg::RoundedRect(x, y, squareWidth, squareWidth, 0);
				nvg::StrokeWidth(1.0);
				nvg::StrokeColor(vec4(0,0,0,0.2));
				nvg::FillColor(tileColour);

				nvg::Fill();
				nvg::Stroke();
				
				
				// Draw stuff
				nvg::BeginPath();
				nvg::MoveTo(vec2(x, y));
				nvg::LineTo(vec2(x + squareWidth, y));
				nvg::LineTo(vec2(x + squareWidth, y + squareWidth));
				nvg::LineTo(vec2(x, y + squareWidth));
				nvg::ClosePath();
				nvg::FillColor(tileColour);
				nvg::Fill();
			}
			isOddTile = ! isOddTile;
		}
		// Labels
		nvg::FillColor(LabelColour);
		nvg::FontSize(squareWidth / 2);
		for(uint rowID = 0; rowID < 8; rowID++)
		{	
			nvg::Text(vec2(X - squareWidth * 0.5, Y + rowID * squareWidth + borderWidth * 1.15), "" + (rowID + 1) + "");
		}
		for(uint cellID = 0; cellID < 8; cellID++)
		{
			nvg::Text(vec2(X + squareWidth * cellID + squareWidth * 0.3, Y + Height + squareWidth * 0.5), LetterLabels[cellID]);
		}
	}
}