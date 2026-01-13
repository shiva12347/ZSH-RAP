@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BookingSupplyment Consumption enity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION
define view entity ZHS_BOOKINGSUPP_C as projection on ZHS_BOOKINGSUPP_I
{
    key BooksupplUuid,
//    BookingUuid,
    TravelUuid,
    ParentUuid,
//    TravelId,
//    BookingId,
    BookingSupplementId,
    SupplementId,
    @Semantics.amount.currencyCode : 'CurrencyCode'
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking:redirected to parent ZHS_BOOKING_C,
    _Travel:redirected to ZHS_TRAVEL_C
}
