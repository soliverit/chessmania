
void Main()
{
	// CSceneVehicleVisState@ vehicleState	= VehicleState::ViewingPlayerState();
	Console	console 	= Console(380, 50);
	console.Opacity		= 0.9;
	console.FontSize	= 15;
	console.BufferSize	= 9;
	// Board	board;

	Chess game		= Chess();
	int baseWidth	= game.GameBoard.Width;
	int baseHeight	= game.GameBoard.Height;
	int baseX		= game.GameBoard.X;
	int baseY		= game.GameBoard.Y;
	game.IsVisible	= true;
	game.IsFinished	= false;
	bool largeMode	= false;
	while(true){	
		CSceneVehicleVisState@ vehicleState	= VehicleState::ViewingPlayerState();
		bool braking	=  vehicleState.InputIsBraking;
		if(braking){
			game.GameBoard.PrintUCITable();
			print(game.GameBoard.ToUCI());
		}
		// float inputGas	= vehicleState.InputBrakePedal ;
		// if(!largeMode	&& inputGas > 0)
		// {
		// 	game.GameBoard.Width	= 400;
		// 	game.GameBoard.Height	= 400;
		// 	game.GameBoard.X		= 300;
		// 	game.GameBoard.Y		= 100;
		// 	largeMode				= true;
		// }
		// else if(largeMode && inputGas <= 0)
		// {
		// 	game.GameBoard.Width	= baseWidth;
		// 	game.GameBoard.Height	= baseHeight;
		// 	game.GameBoard.X		= baseX;
		// 	game.GameBoard.Y		= baseY;
		// 	largeMode				= false;

		// }
		// vec2 mousePosition	= board.GetMouseLocation();
		// console.AddLine("X:" + mousePosition.x + ", " + mousePosition.y);
		// game.IsVisible	= vehicleState.InputGasPedal != 0;
		game.Render();
		console.Render();
		yield();
	}

}
