var google_script_state;

google_script_state = true; // script run = true

function google_ga(trans_type,action_type,content_type,action_name,content_name)
{
	if (google_script_state)
	{
		ga(trans_type,action_type,content_type,action_name,content_name);
	}
}