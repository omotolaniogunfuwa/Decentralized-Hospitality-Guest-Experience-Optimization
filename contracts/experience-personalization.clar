;; Experience Personalization Contract
;; Personalizes guest experiences based on preferences

(define-constant ERR_UNAUTHORIZED (err u400))
(define-constant ERR_PREFERENCE_NOT_FOUND (err u401))

;; Data maps
(define-map guest-preferences principal {
    room-temperature: uint,
    pillow-type: (string-ascii 20),
    dietary-restrictions: (string-ascii 100),
    preferred-services: (list 5 (string-ascii 30)),
    communication-preference: (string-ascii 20)
})

(define-map experience-history principal (list 20 {
    service-type: (string-ascii 30),
    rating: uint,
    timestamp: uint
}))

;; Read-only functions
(define-read-only (get-guest-preferences (guest principal))
    (map-get? guest-preferences guest)
)

(define-read-only (get-experience-history (guest principal))
    (default-to (list) (map-get? experience-history guest))
)

(define-read-only (get-personalized-recommendations (guest principal))
    (let ((preferences (map-get? guest-preferences guest)))
        (match preferences
            prefs (get preferred-services prefs)
            (list)
        )
    )
)

;; Public functions
(define-public (set-guest-preferences
    (room-temperature uint)
    (pillow-type (string-ascii 20))
    (dietary-restrictions (string-ascii 100))
    (preferred-services (list 5 (string-ascii 30)))
    (communication-preference (string-ascii 20)))
    (begin
        (map-set guest-preferences tx-sender {
            room-temperature: room-temperature,
            pillow-type: pillow-type,
            dietary-restrictions: dietary-restrictions,
            preferred-services: preferred-services,
            communication-preference: communication-preference
        })
        (ok true)
    )
)

(define-public (add-experience-record (service-type (string-ascii 30)) (rating uint))
    (let ((current-history (get-experience-history tx-sender))
          (new-record { service-type: service-type, rating: rating, timestamp: block-height }))
        (map-set experience-history tx-sender
            (unwrap! (as-max-len? (append current-history new-record) u20) (err u999)))
        (ok true)
    )
)

(define-public (update-preference-from-experience (service-type (string-ascii 30)))
    (match (map-get? guest-preferences tx-sender)
        preferences (let ((current-services (get preferred-services preferences)))
            (if (is-none (index-of current-services service-type))
                (map-set guest-preferences tx-sender
                    (merge preferences {
                        preferred-services: (unwrap! (as-max-len? (append current-services service-type) u5) (err u999))
                    }))
                false)
            (ok true)
        )
        ERR_PREFERENCE_NOT_FOUND
    )
)
