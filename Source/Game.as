class Game
{
	Board GameBoard;
	Player Player1;
	Player Player2;
	
	Game(){}
	Game(Board board, Player player1, Player player2)
	{
		GameBoard	= board;
		Player1		= player1;
		Player2		= player2;
	}
	void SetUpPieces()
	{
		// Player 1
		Square[] row = GameBoard.Squares[0];
		row[0].SetPiece(Player1.TheFirstCastle);
		row[1].SetPiece(Player1.TheFirstHorse);
		row[2].SetPiece(Player1.TheFirstBishop);
		row[3].SetPiece(Player1.TheQueen);
		row[4].SetPiece(Player1.TheKing);
		row[5].SetPiece(Player1.TheSecondBishop);
		row[6].SetPiece(Player1.TheSecondHorse);
		row[7].SetPiece(Player1.TheSecondCastle);

		row	= Square[1];
		row[0].SetPiece(Player1.Pawns[0]);
		row[1].SetPiece(Player1.Pawns[1]);
		row[2].SetPiece(Player1.Pawns[2]);
		row[3].SetPiece(Player1.Pawns[3]);
		row[4].SetPiece(Player1.Pawns[4]);
		row[5].SetPiece(Player1.Pawns[5]);
		row[6].SetPiece(Player1.Pawns[6]);
		row[7].SetPiece(Player1.Pawns[7]);
		// Player 2
		row = GameBoard.Squares[7];
		row[0].SetPiece(Player2.TheFirstCastle);
		row[1].SetPiece(Player2.TheFirstHorse);
		row[2].SetPiece(Player2.TheFirstBishop);
		row[3].SetPiece(Player2.TheQueen);
		row[4].SetPiece(Player2.TheKing);
		row[5].SetPiece(Player2.TheSecondBishop);
		row[6].SetPiece(Player2.TheSecondHorse);
		row[7].SetPiece(Player2.TheSecondCastle);

		row	= Squares[6];
		row[0].SetPiece(Player2.Pawns[0]);
		row[1].SetPiece(Player2.Pawns[1]);
		row[2].SetPiece(Player2.Pawns[2]);
		row[3].SetPiece(Player2.Pawns[3]);
		row[4].SetPiece(Player2.Pawns[4]);
		row[5].SetPiece(Player2.Pawns[5]);
		row[6].SetPiece(Player2.Pawns[6]);
		row[7].SetPiece(Player2.Pawns[7]);
	}
}