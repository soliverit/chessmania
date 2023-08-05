class Console
{
	int X					= 0;
	int Y					= 0;
	int Width				= 500;
	int FontSize			= 50;
	int RowsCount			= 10;
	int BufferSize			= 10;
	int Spacing				= 2;
	float Opacity			= 1;

	vec4 BackgroundColour	= vec4(0, 0,0,1);
	vec4 FontColour			= vec4(1, 1, 1, 1);
	int Font				= nvg::LoadFont("lora_bold.ttf");

	string[] Lines;

	
	Console(){}
	Console(int x, int y){X=x; Y=y;}
	void AddLine(string line){Lines.InsertLast(line);}
	void Render()
	{
		// Deal with buffer
		while(Lines.Length >= BufferSize){Lines.RemoveAt(0);}
		// Set colours and opacity.
		vec4 backgroundColour	= vec4(BackgroundColour.x, BackgroundColour.y, BackgroundColour.z, Opacity);
		vec4 fontColour			= vec4(FontColour.x, FontColour.y, FontColour.z,Opacity);

		// Box
		nvg::BeginPath();
		nvg::RoundedRect(vec2(X, Y), vec2(Width, BufferSize * (Spacing + FontSize)),2);
		nvg::FillColor(backgroundColour);
		nvg::Fill();

		// Lines
		nvg::FontSize(FontSize);
		nvg::StrokeColor(fontColour);
		nvg::FillColor(fontColour);
		nvg::FontFace(Font);
		for(uint lineID = 0; lineID < Lines.Length; lineID++)
		{
			nvg::Text(vec2(X + 10, Y + (1 + lineID) * ( Spacing + FontSize) + Spacing ), "SHOE SHOE SHOE");
		}
		nvg::Stroke();

		
	}
	
}