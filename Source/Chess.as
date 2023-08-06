class Chess
{
	string	BRAIN_URL	= "http://localhost:5001/chess";
	Board GameBoard;
	Player Player1;
	Player Player2;
	Player CurrentPlayer;
	bool IsVisible;
	bool IsFinished;
	Move[] Moves;
	Chess(){}
	Chess()
	{
		GameBoard		= Board();
		Player1			= Player(true, true);
		Player2			= Player(false, false);
		CurrentPlayer	= Player1;
		Player1.CreatePieces();
		Player2.CreatePieces();
		SetUpPieces();
	}
	void MakeMove(string move)
	{
		if(CurrentPlayer.IsAI)
		{
			if(!CurrentPlayer.IsThinking && !CurrentPlayer.ReadyToMove())
			{
				print("Plato that shit");
				CurrentPlayer.Think(BRAIN_URL);
				return;
			}
			if(!CurrentPlayer.IsThinking() && CurrentPlayer.ReadyToMove())
			{
				print("Player is moving---------");
				print(CurrentPlayer.NextMove);
				print("------------------");
				CurrentPlayer = CurrentPlayer == Player1 ? Player2 : Player1;
				return;
			}
		}
		Moves.InsertLast(Move(CurrentPlayer));
		CurrentPlayer	= CurrentPlayer.Colour == "White" ? Player2 : Player1;	// TODO: A bit dirty
	}

	void SetUpPieces()
	{
		// Player 1
		Square@[] row = GameBoard.Squares[0];
		row[0].SetPiece(Player1.TheFirstRook);
		row[1].SetPiece(Player1.TheFirstHorse);
		row[2].SetPiece(Player1.TheFirstBishop);
		row[3].SetPiece(Player1.TheQueen);
		row[4].SetPiece(Player1.TheKing);
		row[5].SetPiece(Player1.TheSecondBishop);
		row[6].SetPiece(Player1.TheSecondHorse);
		row[7].SetPiece(Player1.TheSecondRook);

		row	= GameBoard.Squares[1];
		row[0].SetPiece(Player1.Pawn1);
		row[1].SetPiece(Player1.Pawn2);
		row[2].SetPiece(Player1.Pawn3);
		row[3].SetPiece(Player1.Pawn4);
		row[4].SetPiece(Player1.Pawn5);
		row[5].SetPiece(Player1.Pawn6);	
		row[6].SetPiece(Player1.Pawn7);
		row[7].SetPiece(Player1.Pawn8);
		// Player 2
		row = GameBoard.Squares[7];
		row[0].SetPiece(Player2.TheFirstRook);
		row[1].SetPiece(Player2.TheFirstHorse);
		row[2].SetPiece(Player2.TheFirstBishop);
		row[3].SetPiece(Player2.TheQueen);
		row[4].SetPiece(Player2.TheKing);
		row[5].SetPiece(Player2.TheSecondBishop);
		row[6].SetPiece(Player2.TheSecondHorse);
		row[7].SetPiece(Player2.TheSecondRook);

		row	= GameBoard.Squares[6];
		row[0].SetPiece(Player2.Pawn1);
		row[1].SetPiece(Player2.Pawn2);
		row[2].SetPiece(Player2.Pawn3);
		row[3].SetPiece(Player2.Pawn4);
		row[4].SetPiece(Player2.Pawn5);
		row[5].SetPiece(Player2.Pawn6);	
		row[6].SetPiece(Player2.Pawn7);
		row[7].SetPiece(Player2.Pawn8);
	}
	void Render()
	{
		if(!IsVisible){
			return;
		}
		GameBoard.Render(CurrentPlayer.Colour);
	}
}