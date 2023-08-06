class Board
{
	//Members
	Square@[][] Squares;
	//Geometry 
	int Width				= 225;
	int Height				= 225;
	int X					= 80;
	int Y					= 80;
	// Colours
	vec4 BoardColour		= vec4(200, 1, 1, 1);
	vec4 SquareOddColour	= vec4(1, 0.80784313, 0.6196078, 1.0);
	vec4 SquareEvenColour	= vec4(0.81960784313, 0.545098, 0.2784313725, 1.0);
	vec4 BorderColour		= vec4(0.1803, 0.0274, 0.00784, .95);
	vec4 OutlineColour		= vec4(1, 0.9803, 0.9568, 0.9);
	vec4 LabelColour		= vec4(1, 0.9803, 0.9568, 1.0);

	int	ChessFont			= nvg::LoadFont("chess.ttf");
	string[] LetterLabels	= {"A", "B", "C", "D", "E", "F", "G", "H"};
	nvg::Font Font = nvg::LoadFont("DroidSans.ttf", true);
	Board()
	{
		for(uint rowID = 0; rowID < 8; rowID++)
		{
			Square@[] row;
			for(uint columnID = 0; columnID < 8; columnID++)
			{
				row.InsertLast(Square());
			}
			Squares.InsertLast(row);
		}
	}
	void PrintUCITable()
	{
		string uci	= "";
		for(uint rowID = 0; rowID < Squares.Length; rowID++)
		{
			int dotCounter = 0;
			string row		= "";
			Square@[] squares	= Squares[rowID];
			for(uint cellID = 0; cellID < squares.Length; cellID++)
			{
				Piece@ piece	= squares[cellID].HeldPiece;
				if(!squares[cellID].HasPiece)
				{
					dotCounter++;
				}
				else
				{
					if(dotCounter > 0){
						for(uint pointID = 0; pointID < dotCounter; pointID++)
						{
					
							row += ".";
							dotCounter = 0;
						}
					}
					else{
						row = row + piece.UCILetter;  
					}
				}
			}
			if(dotCounter > 0){
				for(uint pointID = 0; pointID < dotCounter; pointID++)
				{
			
					row += ".";
					
				}
			}
			uci += "/" + row;
		}
		print(uci);
	}
	string ToUCI()
	{
		string[] rows;
		for(uint rowID = 0; rowID < Squares.Length; rowID++)
		{
			int dotCounter = 0;
			string row		= "";
			Square@[] squares	= Squares[rowID];
			for(uint cellID = 0; cellID < squares.Length; cellID++)
			{
				Piece@ piece	= squares[cellID].HeldPiece;
				if(!squares[cellID].HasPiece)
				{
					dotCounter++;
				}
				else
				{
					if(dotCounter > 0){
						for(uint pointID = 0; pointID < dotCounter; pointID++)
						{
					
							row += "" + dotCounter;
							dotCounter = 0;
						}
					}
					else{
						row = row + piece.UCILetter;  
					}
				}
			}
			if(dotCounter > 0){
				for(uint pointID = 0; pointID < dotCounter; pointID++)
				{
			
					row += ".";
					
				}
			}
			rows.InsertLast(row);
		}
		return string::Join(rows,"/");
	}
	/*

	*/
	/*
		"Geometry" (if you can call it that) helpers 
	*/
	float OffsetX(float x){return x + X;}
	float OffsetY(float y){return y + Y;}
	float InverseOffsetY(float y){return OffsetX(Height) - y;}
	float SquareWidth(){return Width / 8.0;}
	vec2 GetMouseLocation()
	{
		vec2 position	= UI::GetMousePos();
		return vec2(position.x - X, position.y - Y);
	}
	bool MouseIsOverBoard()
	{
		vec2 position	= GetMouseLocation();
		return position.x >= X && position.x <= position.x  + X + Width && position.y >= Y && position.y <  Y + Height;
	}
	void Render()
	{
		int squareWidth	= SquareWidth();
		int borderWidth	= squareWidth / 1.6;
		// Border
		nvg::BeginPath();
		nvg::RoundedRect(vec2(X - borderWidth , Y - borderWidth),vec2(Width + borderWidth * 2, Height + borderWidth * 2), 4.0);
		nvg::StrokeWidth(2.0);
		nvg::StrokeColor(OutlineColour);
		nvg::FillColor(BorderColour);
		nvg::Fill();
		nvg::Stroke();
		nvg::ClosePath();	
		// Labels
		nvg::FillColor(vec4(1,1,1,1));
		nvg::FontSize(squareWidth / 2);
		
		for(uint rowID = 0; rowID < 8; rowID++)
		{	
			// Adjustments are eyeballed for now. Ah'll write something sensible later.
			nvg::Text(vec2(X - squareWidth * 0.5, Y + rowID * squareWidth + borderWidth * 1.15), "" + (rowID + 1) + "");
		}
		for(uint cellID = 0; cellID < 8; cellID++)
		{
			nvg::Text(vec2(X + squareWidth * cellID + squareWidth * 0.3, Y + Height + squareWidth * 0.5), LetterLabels[cellID]);
		}
		// Squares
		float width		= 0;
		float height	= 0;
		bool isOddTile	= true;
		nvg::FontFace(ChessFont);
		for(uint rowID = 0; rowID < 8; rowID++)
		{	
			int y	= Y + squareWidth * rowID;
			height += squareWidth;
			for(uint cellID = 0; cellID < 8; cellID++)
			{
				Square	square	= Squares[rowID][cellID];
				height += squareWidth;
				// Position
				int x	= X + squareWidth * cellID;
				// Colour
				vec4 tileColour	= isOddTile ? SquareOddColour : SquareEvenColour;
				isOddTile	= ! isOddTile;
				// Draw
				nvg::BeginPath();

				nvg::RoundedRect(x, y, squareWidth, squareWidth, 0);
				nvg::StrokeWidth(3.0);
				nvg::StrokeColor(vec4(0,0,0,0.2));
				nvg::FillColor(tileColour);
				nvg::Fill();
				nvg::Stroke();
			
				nvg::ClosePath();
				// Draw piece

				vec4 colour	= square.HeldPiece.Colour == "White" ? vec4(1,1,1,1) : vec4(0,0,0,1);
				nvg::FillColor(colour);
				
				nvg::FontSize(squareWidth);
				nvg::Text(vec2(x , y+ squareWidth - 3), square.HeldPiece.Letter);


			}
			isOddTile = ! isOddTile;
		}

		
	}
}