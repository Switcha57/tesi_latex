```mermaid
    DOS[MS-DOS Header<br/> IMAGE_DOS_HEADER]
    STUB[DOS Stub]
    SIGN[PE Signature<br/>]
    COFF[COFF File Header<br/>]
    OPT[Optional Header<br/>]
    DIR[Data Directories<br/>]
    SECT[Section Table<br/>]

    subgraph Sections
        TEXT[".text"]
        RDATA[".rdata"]
        DATA[".data "]
        RSRC[".rsrc"]
        RELOC[".reloc"]
    end

    DOS --> STUB --> SIGN --> COFF --> OPT --> DIR --> SECT --> Sections
    DIR -->|export table| EXPORT["Export"]
    DIR -->|import table| IMPORT["Import"]
    DIR -->|IAT| IAT["Import Address Table"]
    DIR -->|debug| DEBUG["Debug"]
    DIR -->|TLS| TLS["TLS"]

    EXPORT --> TEXT
    IMPORT --> RDATA
    IAT --> TEXT
    RSRC --> RSRC
```