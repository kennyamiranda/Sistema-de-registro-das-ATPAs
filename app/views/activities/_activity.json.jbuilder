# Parâmetros para envio de um arquivo do tipo Json
son.extract! activity, :id, :grupo, :data_evento, :titulo, :tipo, :local_realizacao_atividade, :relatorio, :user_id, :hora_computada, :created_at, :updated_at
json.url activity_url(activity, format: :json)
