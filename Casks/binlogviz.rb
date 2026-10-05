cask "binlogviz" do
  version "0.23.13"

  on_macos do
    on_intel do
      sha256 "7cbdfd656f5a3edc2b5d36ac0e60fcd8b3a990409bb010fec6df4ef9c1b95357"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.13/binlogviz_0.23.13_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "132161317dddb044f9b3513186023d7381bbbf8ebe9b3c9a9f411e5cd1198ede"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.13/binlogviz_0.23.13_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "273539f1338aa33c31c9364c6be43e1e2797dd5b9976482b56615abe46945060"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.13/binlogviz_0.23.13_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "e2ff587bfc4d1a1bfdf50f4989d8d9b569f8dc23f357fcd08eb9af833ed8cad7"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.13/binlogviz_0.23.13_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
