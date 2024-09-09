SELECT
  CASE WHEN ROW_NUMBER() OVER (PARTITION BY characters.name ORDER BY actions.action) = 1 THEN characters.name ELSE '' END AS name,
  actions.action
FROM
  character_actions
FULL JOIN characters ON character_actions.character_id = characters.character_id
FULL JOIN actions ON character_actions.action_id = actions.action_id
ORDER BY characters.name, actions.action;
