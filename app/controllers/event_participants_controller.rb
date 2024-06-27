class EventParticipantsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :authorize

  def create
    @event_participant = @event.event_participants.new(user: current_user)

    if @event_participant.save
      redirect_to @event, notice: 'Você se registrou para o evento com sucesso.'
    else
      redirect_to @event, alert: 'Não foi possível se registrar para o evento.'
    end
  end

  def destroy
    @event_participant = @event.event_participants.find_by(user: current_user)

    if @event_participant.destroy
      redirect_to @event, notice: 'Você se retirou do evento com sucesso.'
    else
      redirect_to @event, alert: 'Não foi possível se retirar do evento.'
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
