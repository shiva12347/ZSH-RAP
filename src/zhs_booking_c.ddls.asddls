@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Consumption entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION
define view entity ZHS_BOOKING_C as projection on ZHS_BOOKING_I
{
    key BookingUuid,
    ParentUuid,
    TravelId,
    BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    @Semantics.amount.currencyCode : 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BookingSupplement:redirected to composition child ZHS_BOOKINGSUPP_C,
    _Tarvel:redirected to parent ZHS_TRAVEL_C
}
